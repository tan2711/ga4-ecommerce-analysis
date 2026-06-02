# Google Data Analytics Capstone: Revenue Analysis

**Course:** Google Data Analytics Professional Certificate – Capstone Project

# Introduction

In this capstone project, I analyzed customer behavior using Google Analytics 4 (GA4) e-commerce data. The objective was to understand how users interact with the online store, perform purchase funnel analysis, evaluate product performance, and figure out which customer segments actually drive revenue. To answer key business questions, I followed the six phases of the Google data analytics process: **Ask, Prepare, Process, Analyze, Share, Act**

## Quick Links

- [Google Data Analytics Professional Certificate](https://www.coursera.org/learn/google-data-analytics-capstone)
- [Google Analytics 4 E-commerce Dataset](https://support.google.com/analytics/answer/7586738#zippy=%2Cin-this-article)
- [Tableau Dashboard](https://public.tableau.com/views/GoogleAnalytics4GA4E-commerceDataRevenueAnalysis/Sheet5?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [SQL Queries](https://github.com/tan2711/ga4-ecommerce-analysis/blob/main/GA4%20SQL%20queries.sql.sql)

### Data Source

Google Analytics 4 (GA4) E-commerce Dataset

### SQL Queries
1. Data Preparation & Cleaning
2. Purchase Funnel Analysis
3. Product Performance Analysis
4. Geographic Revenue Analysis
5. Device & Customer Behavior Analysis

### Data Visualization

Tableau

# Background

## Business Context

E-commerce websites tend to generate tons of customer interaction data on a daily basis. Understanding how visitors move through the customer journey from viewing products to completing purchases is essential for being able to improve conversion rates and as a result maximize revenue.

By analyzing customer interactions and transaction data, the business can make better decisions to improve marketing performance and drive up revenue. Thats why the company wants to better understand the following:
* Where customers drop off during the purchasing process ?
* Which products bring in the most revenue ? 
* Which countries contribute the most to sales ?
* How device usage affects buying behavior ?
* Where there are opportunities to improve conversion and retention ?


# Scenario

I am assuming to be a junior data analyst working on the marketing analytics team at an online retail company. The marketing and business teams believe the company's future success depends on understanding how customers behave across the website. Therefore, my team wants to uncover insights to design a marketing strategy to improve conversion rates and maximize revenue. 

But first, company executives must approve our recommendations, so they must be backed up with compelling data insights and professional visualizations. Using Google Analytics 4 event-level data, I will perform SQL analysis in BigQuery and build an interactive Tableau dashboard as the final deliverable.

# Ask

## Business Task

Analyze customer behavior and purchasing patterns to identify opportunities for increasing conversions and revenue.

## Analysis Questions

The project focuses on answering the following business questions:

### Customer Journey

* How effectively are users progressing through the purchase funnel?
* At which stage do the highest customer drop-offs occur?

### Product Performance

* Which products generate the highest revenue?
* Which products attract engagement but fail to convert into purchases?

### Geographic Performance

* Which countries contribute the highest revenue?
* How does customer purchasing behavior vary across regions?

### Device Analysis

* Which devices drive the most traffic?
* Which devices generate the highest conversion rates and revenue?

# Prepare

## Data Source

I used the Google Analytics 4 (GA4) E-commerce dataset available through Google BigQuery to analyze customer behavior and purchasing patterns. The dataset contains user interaction data collected from an online retail website between January 2021 and August 2021, including product views, add-to-cart events, checkout activities, purchases, device information, geographic data, and transaction revenue.

This is publicly available sample data provided by Google for analytical and educational purposes. The dataset does not contain personally identifiable information, ensuring compliance with privacy regulations while still allowing meaningful analysis of customer journeys and purchasing behavior.

## Data Organization

The dataset is organized as event-level records, where each row represents a user interaction on the website. Events are stored across daily tables and capture customer activity throughout the purchasing journey.

The analysis focuses on key e-commerce events such as product views, add-to-cart actions, checkout initiations, and purchases. Key fields used include event_name, event_date, country, device_category, item_name, purchase_revenue, and transaction_id.

These fields were used to analyze purchase funnel performance, product sales, device behavior, and revenue distribution across countries.

# Process

BigQuery was used to explore, clean, and analyze the Google Analytics 4 e-commerce dataset.

## Reason

The dataset contains thousands of event-level records generated from user interactions across an e-commerce website. I made use of BigQuery because it efficiently handles large datasets and allows complex SQL queries to be executed quickly in very little time.

## Data Exploration

### SQL Query: Data Exploration

Before performing the analysis, the dataset was explored to understand its structure, identify key fields, and check for potential data quality issues.

### Observations

The table below shows the dataset schema, including column names and data types.

<img width="428" height="436" alt="image" src="https://github.com/user-attachments/assets/dafa5019-c71d-4750-b4d3-2a70f8f7a0ce" />
<img width="430" height="269" alt="image" src="https://github.com/user-attachments/assets/fcdb6b41-b48b-406b-bf08-aa509cb0f4c8" />

The dataset contains event-level records where each row represents a user interaction on the website.

The event_name field contains multiple event types, including:

<img width="262" height="512" alt="image" src="https://github.com/user-attachments/assets/4354cfb5-4911-4614-85f3-dd2bb301d242" />

The analysis focused on the following key e-commerce events: view_item, add_to_cart, begin_checkout, purchase

Missing values query was run on important columns like transaction_id, purchase_revenue, item_name, country, and device_category. Duplicate transaction records were also checked using transaction_id to make sure that the purchases were not counted multiple times when totaling the revenue. However, no significant data quality issues were identified that would impact the analysis.


## Data Cleaning

### SQL Query: Data Cleaning

The following cleaning and transformation steps were performed:
  1. Converted event_date into a standard date format
  2. Selected the key e-commerce events required for analysis
  3. Extracted product, revenue, country, and device information from the dataset
  4. Checked for missing values and duplicate transaction records
  5. Created summary tables to support funnel, product, country, and device analysis

## Analyze & Share

### SQL Query: Data Analysis 
### Data Visualization: Tableau 

# Purchase Funnel Analysis

The purchase funnel tracks how users move through the buying journey: view an item, add it to the cart, start checkout, and finally purchase.


<img width="962" height="198" alt="image" src="https://github.com/user-attachments/assets/b35be31e-ab8e-42ad-9d9f-aaac538ff925" />


Out of 22,145 users who viewed a product, only 1,284 completed a purchase, showing the overall conversion rate as 5.8%. The biggest drop-off happens after people add items to their cart but before they start checkout, where user count drops by 54.4%. 

Then, from checkout to purchase, the drop-off was 58.8% so only 1,284 of the 3,117 users who started checkout actually completed their purchase. That points to a serious abandonment problem in the final stage.

These findings suggest that optimizing the checkout process could improve conversion rates and increase overall revenue.

---

# Product Analysis

Products were evaluated based on total revenue, quantity sold, and unique buyers.


<img width="962" height="318" alt="image" src="https://github.com/user-attachments/assets/8cc9e262-185c-4b58-a0fb-da604af7b404" />


The Google Zip Hoodie F/C is the top product, bringing in $13,788 in revenue from 273 sold units and 218 unique buyers. The Google Crewneck Sweatshirt Navy ranked second with $10,714, and the Google Men's Tech Fleece Grey generated $9,964 even though it sold fewer units than several other products.

The Super G Unisex Joggers had the highest sales volume at 308 units, but only ranked fifth in revenue with $9,548. That can be due to lower average selling price compared to other top performers.

A small group of products make up most of the total revenue making them key drivers of overall business performance. The top 10 products alone brought in over $85,000. Most of these top products attracted between 45 and 221 unique buyers, which shows a steady demand across different customer segments.

---

# Traffic Source Analysis

To figure out how well each channel is performing, revenue generation was analyzed across all traffic sources.

<img width="368" height="490" alt="image" src="https://github.com/user-attachments/assets/7a6fe785-8395-4168-8ad7-079d9ebf71f4" />


Google was the top revenue driver, bringing in $104.8K from 117.5K users since search traffic tends to attract people ready to buy. Direct traffic performed well too, generating $79.7K from 1,251 purchases, showing signs of solid brand awareness and repeated visitors.

The "Data Deleted" segment had only 17.9K users but still brought in over $50K in revenue. That's a much higher revenue per user than other sources, however because the original acquisition source is unavailable, this revenue cannot be attributed to a specific marketing channel.

Overall, revenue is concentrated among a few key sources. Google, Direct, and Others make up most sales, meaning our acquisition efforts depend heavily on a limited set of channels.


---

# Geographic Revenue Analysis

Analysis of user volume, purchase activity, and revenue were done to identify the most valuable markets.

<img width="1279" height="604" alt="image" src="https://github.com/user-attachments/assets/d407624e-8d6d-4f61-afd6-899abf3cdfda" />


The United States was the dominant market by a wide margin, generating $160.6K in revenue from 118.5K users and 2,481 purchases.

India and Canada emerged as strong secondary markets, ranking second and third with $35.0K and $32.8K respectively. They together accounted for a good share of international sales outside the US.

Revenue was heavily concentrated in a few countries mainly the top three so the US, India, Canada. They drove the majority of total sales showing the store attracted a global customer base, with purchases and revenue coming from North America, Europe, and Asia.


---

# Device Performance Analysis

Device performance analysis done by looking at user volume, purchases, and revenue to see how customer behaviour differs across platforms.

<img width="944" height="490" alt="image" src="https://github.com/user-attachments/assets/e12d86c5-5297-4f76-9f3e-1a3d4a38999b" />

Desktop came first, bringing in $208.8K from 3,226 purchases. Mobile wasn't far behind, contributing $146.8K from 2,355 purchases which is a clear evidence that mobile users are actively buying and not just browsing.

Desktop and mobile together accounted for nearly all user activity and revenue as shown in the visualization. Tablets, on the other hand, played a minor role with only $6.6K in revenue from 111 purchases.

Interestingly, desktop users completed more purchases and generated higher revenue than mobile users, suggesting that while people shop both, they're more likely to finalize purchasing a desktop.


# Act

| Finding | Business Action |
|---------|----------------|
| Only 1,284 of 22,145 product viewers completed a purchase, with the biggest drop‑off at checkout | Set up automated abandoned‑cart emails targeting users who leave items in their cart. Offer a small incentive like free shipping or a limited‑time discount to encourage them to complete the purchase |
| Top 10 products generated over $85K making them key sales drivers. | Put these products on the homepage, in email newsletters, and bundle them with related items (e.g., hoodie + socks). This increases average order value and maximizes revenue from best sellers |
| Google ($104.8K) and Direct ($79.7K) delivered most revenue | Invest in Google Ads and SEO, and keep nurturing direct traffic through brand loyalty. At the same time, test small budgets on new channels like social media, affiliate etc to reduce dependence on just two sources |
| India ($35K) and Canada ($32.8K) top markets outside the US | Run country‑specific promotions, like Diwali sales for India. Translate key marketing materials and consider local payment methods to boost conversions in these regions |
| Mobile revenue which is $146.8K trails $208.8K revenue incurred from desktop | Simplify the mobile checkout process by reducing form fields and ensuring payment buttons are easy to use. Run A/B tests on mobile page load speed and button placement to remove any kind of friction |



