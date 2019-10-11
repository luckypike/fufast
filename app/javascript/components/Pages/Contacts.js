import React from 'react'
import { YMaps, Map, Placemark, ZoomControl, GeolocationControl, FullscreenControl, RulerControl, TypeSelector, TrafficControl } from 'react-yandex-maps'

import page from '../Page.module.css'
import styles from './Contacts.module.css'

export default function Contacts () {
  return (
    <div className={page.root}>
      <div className={styles.image} />

      <div className={page.text}>
        <h1>
          Контакты
        </h1>

        <p>
          ООО «Поволжье-спецодежда» (торговая марка «Фуфайка»)
        </p>
        <h2>Телефон</h2>
        <p>
          + 7 910 793 7733
        </p>
        <h2>
          Время работы
        </h2>
        <p>
          ПН-ПТ: с 9:00 до 18:00
        </p>
        <h2>
          Адрес
        </h2>
        <p>
          Волкова, 5А, Нижний Новгород, 603041, Россия
        </p>

        <div className={styles.maps}>
          <YMaps>
            <Map className={styles.ymap} width={'100%'} defaultState={{ center: [56.24271361610231, 43.83043802718367], zoom: 17, width: 100 }}>
              <Placemark defaultGeometry={[56.24271361610231, 43.83043802718367]} />
              <ZoomControl options={{ float: 'right' }} />
              <GeolocationControl options={{ float: 'left' }} />
              <FullscreenControl />
              <RulerControl options={{ float: 'right' }} />
              <TypeSelector options={{ float: 'right' }} />
              <TrafficControl options={{ float: 'right' }} />
            </Map>
          </YMaps>
        </div>

        <h2>
          Доставка
        </h2>
        <p>
          Мы доставим ваш заказ в любой город России. Доставка осуществляется транспортными компаниями.
          <br />
          Доставка по Нижнему Новгороду: 500 рублей. При заказе свыше 30 000 рублей доставка бесплатная.
        </p>
        <h2>Реквизиты</h2>
        <p>
          ООО «Поволжье-спецодежда»
          <br />
          ИНН: 5260122994, КПП: 503201001, ОГРН: 1035205418181
          <br />
          Юр. Адрес: 143005, Московская обл., Одинцовский р-н, г. Одинцово, ул. Вокзальная д. 19, кв. 17
        </p>
      </div>
    </div>
  )
}
