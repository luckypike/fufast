<?php

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Mvc\Application;
use Phalcon\Config\Adapter\Ini as ConfigIni;
use Phalcon\Di\FactoryDefault;

use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Mvc\Router;

use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;

$config = new ConfigIni('../app/config/config.ini');
$loader = new Loader();

$loader->registerDirs([
  "../app/controllers/",
  "../app/models/",
  "../app/library/",
 ]);

$loader->register();

$di = new FactoryDefault();

$di->set(
  "db",
  function () use ($config) {
    return new DbAdapter(
      [
        'host' => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname'   => $config->database->dbname,
        'charset'   =>$config->database->charset
      ]
    );
  }
);

$di->set(
  "voltService",
  function ($view, $di) {
    $volt = new Volt($view, $di);

    $volt->setOptions(
      [
        "compiledPath"      => "../cache/volt/",
        // "compiledExtension" => ".compiled",
      ]
    );

    return $volt;
  }
);

$di->set(
  "view",
  function () {
    $view = new View();

    $view->setViewsDir("../app/views/");

    $view->registerEngines(
      [
        ".volt" => "voltService",
      ]
    );

    return $view;
  }
);

$di->set(
  'url',
  function () {
    $url = new UrlProvider();

    $url->setBaseUri("/");

    return $url;
  }
);

$di->set(
  'router',
  function () {
    $router = new Router();

    $router->removeExtraSlashes(true);

    $router->add(
      "/catalog/{slug:[a-z\-_]+}",
      [
        "controller" => 'sections',
        "action" => "show",
      ]
    );

    $router->add(
      "/catalog/{id:[0-9]+}",
      [
        "controller" => 'products',
        "action" => "show",
      ]
    );


    $router->handle();

    return $router;
  }
);

$di->set(
  'tree',
  function () {
    return new Tree();
  },
  true
);

$application = new Application($di);

try {
  $response = $application->handle();

  $response->send();
} catch (\Exception $e) {
  echo "Exception: ", $e->getMessage();
}