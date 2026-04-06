# 📊 E-Commerce Revenue and Conversion Analysis | SQL + Power BI

## 📌 Project Overview
This project analyzes customer behavior and conversion patterns in an e-commerce platform using SQL and Power BI. The goal is to generate business insights and recommendations that can help improve marketing strategy, customer targeting, and revenue performance.

The analysis focuses on understanding how **customer demographics, session behavior, devices, and acquisition channels** influence revenue and conversions.

---

## 🛍️ Business Scenario
A mid-sized Shopify e-commerce store wants to improve its revenue and conversion rate. The business collects data on website sessions, customer demographics, traffic sources, devices, and purchases.

The management team wants to answer the following questions:

- Which customer demographics generate the most revenue?
- Which traffic sources bring the most conversions?
- Which countries and customer segments perform best?
- How do revenue and conversions trend over time?
- Are there differences between male and female customers in purchasing behavior?

The goal of this analysis is to **identify high-performing customer groups and acquisition channels** to improve marketing strategy and increase revenue.

---

## 📂 Dataset
**Source:**  
[Kaggle – E-Commerce Customer Behavior and Conversion Prediction](https://www.kaggle.com/datasets/birendeepsingh/e-commerce-customer-behavior-and-conversion-prediction)

**Files Used**
- `ecommerce_sessions.csv` – Session-level behavioral data  
- `ecommerce_users.csv` – User demographic data  

**Key Features**
- Session duration and pages viewed  
- Traffic source and device type  
- Conversion indicator  
- Revenue per session  
- Age, gender, country  
- Customer segment  

---

## 🛠️ Tools & Technologies
- **SQL Server (SSMS)** – Data querying and analysis  
- **Power BI** – Dashboard and visualization  
- **Excel/CSV** – Dataset  

---

## 📊 Analysis Summary
The analysis focused on:

- Overall business KPIs  
- Revenue and conversions by age group  
- Monthly revenue and conversion trends  
- Session duration and engagement  
- Revenue and conversions by country, customer segment, and traffic source
- Device performance  
- Gender purchasing behavior  

---

## 📊 Key Insights

### 👥 Customer Demographics
- The **30–44 age group** generated the highest revenue and conversions  
- The **18–29 age group** was the second highest contributor  
- Customers aged **60+ purchase less frequently but have higher-value purchases**  
- There are **more female users**, but **male users generate higher revenue and higher average order value**

**Interpretation:**  
30–44 are core customers, 18–29 are growth customers, and older customers are high-value premium buyers.

---

### 🧠 Customer Behavior
- Sessions lasting **5–10 minutes generated the highest revenue**  
- Very long sessions (20–60 minutes) generated the lowest revenue  

**Interpretation:**  
Customers who spend a moderate amount of time are more likely to purchase, while very long sessions may indicate browsing with low buying intent, difficulty finding products or checkout issues.

---

### 📈 Revenue Trends
- **April generated the highest revenue**  
- **May had the highest sessions and conversions**  
- April revenue peak was likely driven by **premium customers with higher order values**

**Interpretation:**  
Higher traffic does not always mean higher revenue, high-value customers drive revenue more than high traffic volume.

---

### 🌍 Geographic Performance
- **United States** generated the highest revenue, sessions, and conversions  
- **Japan generated relatively high revenue despite having the lowest cnversions**, indicating higher-value purchases  
- **India generated the lowest revenue**

---

### 🧩 Customer Segments
- **Regular customers generated the highest total revenue**  
- **Budget customers had the highest average order value**  
- **Premium customers generated high revenue despite fewer conversions**

**Interpretation:**  
Regular customers drive revenue through volume, while Budget and Premium customers drive revenue through higher-value purchases.

---

### 📣 Traffic Sources
- **Organic traffic generated the highest revenue and conversions**  
- **Email traffic generated the lowest revenue and conversions**  
- Conversion rates across traffic sources were relatively similar (~2.6%–3.5%)

**Interpretation:**  
Organic traffic brings the most valuable users, while email marketing may not be performing well.

---

### 📱 Device Usage
- **Mobile generated the highest revenue, sessions, and conversions**  
- Desktop was second, tablet was minimal  

**Interpretation:**  
Most users browse and purchase using mobile devices, making mobile optimization very important.

---

## 🧠 Business Interpretation
From a business perspective, the store appears to have:

- A large regular customer base  
- A mobile-first customer base  
- Strong performance from organic search traffic  
- High-value customers in Japan and older age groups  
- Underperforming email marketing  
- Customers who convert most during 5–10 minute sessions  

This suggests focusing on:
- SEO and organic traffic  
- Mobile experience optimization  
- Premium product targeting  
- Email marketing improvements  
- Checkout and navigation optimization  

---

## 📈 Business Recommendations

### 📣 Marketing Strategy
- Focus campaigns on **30–44 (core)** and **18–29 (growth)** age groups  
- Invest in **SEO and organic traffic**  
- Improve **email marketing** (abandoned cart, discounts, promos)  
- Promote **premium products/bundles to older users and Japan market**  
- Introduce **loyalty programs for Regular customers**  
- Offer **bundle discounts** to potentially increase order value  

---

### 🛍️ Product & UX Strategy
- Optimize **mobile user experience**  
- Add **product recommendations** and *“Frequently Bought Together”* during browsing
- Improve **navigation and search functionality**  
- Simplify **checkout process**
- Optimize product titles and descriptions for search keywords 

---

### 🌍 Geographic Strategy
- Focus advertising in **United States**  
- Promote premium offerings in **Japan**  
- Reduce spend in **low-performing regions (e.g., India)**  

---

## 📌 Conclusion
This project demonstrates how SQL and Power BI can be used to analyze e-commerce data and generate business insights. The analysis identified key revenue drivers across customer demographics, traffic sources, devices, and regions, and provided actionable recommendations to improve marketing strategy, customer targeting, and overall business performance.

---
