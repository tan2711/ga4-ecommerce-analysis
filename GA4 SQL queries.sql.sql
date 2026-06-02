-- Data Quality Check
SELECT
COUNT(*) AS total_rows,
COUNTIF(user_pseudo_id IS NULL) AS missing_users,
COUNTIF(traffic_source.source IS NULL) AS missing_source,
COUNTIF(device.category IS NULL) AS missing_device
FROM
`bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;


-- Data preparation & preview 
SELECT
  PARSE_DATE('%Y%m%d', event_date) AS event_date,
  event_name,
  user_pseudo_id,
  device.category AS device_type,
  geo.country AS country,
  traffic_source.source AS traffic_source,
  traffic_source.medium AS traffic_medium,
  ecommerce.purchase_revenue AS purchase_revenue
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
LIMIT 20;


-- Funnel Analysis
SELECT
  event_name,
  COUNT(DISTINCT user_pseudo_id) AS unique_users
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  event_name IN (
    'view_item',
    'add_to_cart',
    'begin_checkout',
    'purchase'
  )
GROUP BY
  event_name
ORDER BY
  unique_users DESC;


-- Product Analysis
SELECT
  items.item_name,
  SUM(items.quantity) AS total_quantity_sold,
  SUM(items.price * items.quantity) AS total_revenue,
  COUNT(DISTINCT user_pseudo_id) AS unique_buyers
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS items -- Used UNNEST because product info is stored in a repeated field 
WHERE
  event_name = 'purchase' AND items.item_name IS NOT NULL
GROUP BY
  items.item_name
ORDER BY
  total_revenue DESC
LIMIT 10;


-- Traffic Source Analysis
SELECT
  traffic_source.source AS source,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNTIF(event_name = 'purchase') AS purchases,
  SUM(ecommerce.purchase_revenue) AS total_revenue
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY
  source
ORDER BY
  total_revenue DESC
LIMIT 10;


-- Device Analysis
SELECT
  device.category AS device_type,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNTIF(event_name = 'purchase') AS purchases,
  SUM(ecommerce.purchase_revenue) AS total_revenue
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY
  device_type
ORDER BY
  total_revenue DESC;


-- Geographic Analysis
SELECT
  geo.country AS country,
  COUNT(DISTINCT user_pseudo_id) AS users,
  COUNTIF(event_name = 'purchase') AS purchases,
  SUM(ecommerce.purchase_revenue) AS total_revenue
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY
  country
ORDER BY
  total_revenue DESC
LIMIT 10;


-- Currency Conversion (USD to INR) {using an approximate historical exchange rate of ₹73/USD}
SELECT
  geo.country AS country,
  SUM(ecommerce.purchase_revenue) AS revenue_usd,
  SUM(ecommerce.purchase_revenue) * 73 AS estimated_revenue_inr
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  event_name = 'purchase'
GROUP BY
  country
ORDER BY
  estimated_revenue_inr DESC
LIMIT 10;
