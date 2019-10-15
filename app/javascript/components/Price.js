const currency = (source) => {
  const float = parseFloat(source)

  const formatter = new Intl.NumberFormat('ru-RU', {
    minimumFractionDigits: Math.round(float) === float ? 0 : 2,
    maximumFractionDigits: Math.round(float) === float ? 0 : 2
  })

  let value = formatter.format(source)
  if (source < 10000) value = value.replace(/\s/, '')
  return `${value} ₽`
}

export { currency }
