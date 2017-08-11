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
use Phalcon\Session\Adapter\Files as Session;

$config = new ConfigIni('../app/config/config.ini');
$loader = new Loader();

$loader->registerDirs([
  "../app/controllers/",
  "../app/models/",
  "../app/library/",
 ]);

$loader->register();

$di = new FactoryDefault();

$di->set('config', $config);

$di->set(
  'db',
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

$di->setShared(
  'session',
  function () {
    $session = new Session();

    $session->start();

    return $session;
  }
);

$di->set(
  'voltService',
  function ($view, $di) use ($config) {
    $volt = new Volt($view, $di);
    $volt->setOptions(
      [
        'compiledPath' => '../cache/volt/',
        'compileAlways' => $config->volt->compileAlways
        // "compiledExtension" => ".compiled",
      ]
    );

    $compiler = $volt->getCompiler();
    $compiler->addFunction('int', 'intval');
    $compiler->addFunction('money', 'money_format_smart');

    return $volt;
  }
);

function money_format_smart($number) {
  $decimals = 0;
  if(fmod($number, 1) > 0) {
    $decimals = 2;
  }

  return number_format($number, $decimals, ',', ' ');
}

$di->set(
  'view',
  function () {
    $view = new View();

    $view->setViewsDir("../app/views/");

    $view->registerEngines(
      [
        ".volt" => "voltService",
      ]
    );

    $view->setVar('site_url', 'http' . (empty($_SERVER['HTTPS'])?'':'s') . '://' . $_SERVER['HTTP_HOST']);

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
    $router = new Router(false);

    $router->removeExtraSlashes(true);

    $router->notFound([
      'controller' => 'static',
      'action' => 'route404',
    ]);

    $router->add(
      '/',
      [
        'controller' => 'static',
        'action' => 'index',
      ]
    );

    $router->add(
      '/about',
      [
        'controller' => 'static',
        'action' => 'about',
      ]
    );

    $router->add(
      '/contacts',
      [
        'controller' => 'static',
        'action' => 'contacts',
      ]
    );

    $router->add(
      '/logo',
      [
        'controller' => 'static',
        'action' => 'logo',
      ]
    );

    $router->add(
      '/catalog',
      [
        'controller' => 'static',
        'action' => 'catalog',
      ]
    );

    $router->add(
      '/catalog.yml',
      [
        'controller' => 'static',
        'action' => 'yml',
      ]
    );

    $router->add(
      '/sitemap.xml',
      [
        'controller' => 'static',
        'action' => 'sitemap',
      ]
    );

    $router->add(
      '/catalog/{slug:[a-z\-_\s0-9]+}',
      [
        'controller' => 'sections',
        'action' => 'show',
      ]
    );

    $router->add(
      '/catalog/{id:[0-9]+}',
      [
        'controller' => 'products',
        'action' => 'show',
      ]
    );

    $router->add(
      '/catalog/basket',
      [
        'controller' => 'products',
        'action' => 'basket',
      ]
    );

    $router->add(
      '/search',
      [
        'controller' => 'products',
        'action' => 'search',
      ]
    );

    $router->add(
      '/cover/title/{id:[0-9]+}/{size:[a-z]+}.jpg',
      [
        'controller' => 'images',
        'action' => 'cover',
      ]
    );

    $router->add(
      '/cover/images/{id:[0-9]+}/{size:[a-z]+}.jpg',
      [
        'controller' => 'images',
        'action' => 'file',
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

$di->set(
  'same',
  function () {
    return new Same();
  },
  true
);

$di->set(
  'basket',
  function () {
    return new Basket();
  },
  true
);

$di->set('metatag', function() {
  return new MetaTags();
});

Phalcon\Tag::setTitle($config->site->site_name);
Phalcon\Tag::setTitleSeparator(' — ');

$application = new Application($di);

try {
  $response = $application->handle();
  $response->send();
} catch (\Exception $e) {
  echo "Exception: ", $e->getMessage();
}