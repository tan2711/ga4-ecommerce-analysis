# Google Data Analytics Capstone: Revenue Pricing & Profitability Analysis

**Course:** Google Data Analytics Professional Certificate – Capstone Project

# Introduction

In this capstone project, I analyzed customer behavior using Google Analytics 4 (GA4) e-commerce data. The objective was to understand how users interact with the online store, perform purchase funnel analysis, evaluate product performance, and figure out which customer segments actually drive revenue. To answer key business questions, I followed the six phases of the Google data analytics process: **Ask, Prepare, Process, Analyze, Share, Act**

## Quick Links

- [Google Data Analytics Professional Certificate](https://www.coursera.org/learn/google-data-analytics-capstone)
- [Google Analytics 4 E-commerce Dataset](LINK)
- [Tableau Dashboard](LINK)
- [SQL Queries](LINK)

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

E-commerce websties tend to generate tons of customer interaction data on a daily basis. Understanding how visitors move through the customer journey from viewing products to completing purchases is essential for being able to improve conversion rates and as a result maximize revenue.

By analyzing customer interactions and transaction data, the business can make better decisions to improve marketing performance and driving up revenue. Thats why the company wants to better understand the following:
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

The dataset contains thousands of event-level records generated from user interactions across an e-commerce website. I made use of BigQuery because it efficiently handles large datasets and allows complex SQL queries to be executed perfectly in very little time.

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

Missing values query was run in important columns like transaction_id, purchase_revenue, item_name, country, and device_category.Duplicate transaction records were also checked using transaction_id to make sure that the purchases were not counted multiple times when totaling the revenue. Though, no significant data quality issues were identified that would impact the analysis.


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
