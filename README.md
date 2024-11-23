# DBT + Snowflake Project for MongoDB Mflix JSON Files

This project uses **DBT (Data Build Tool)** and **Snowflake** to manage and process raw JSON data exported from the **MongoDB Mflix dataset**. The dataset is stored in **Amazon S3**, and this project automates the creation of **stages** and **views** in Snowflake to enable querying and analysis of the raw data.

## 📄 Project Overview

The main goals of this project are:
1. **Automate Stage Creation**: Dynamically create Snowflake stages pointing to raw JSON files stored in S3.
2. **Simplify Data Access**: Generate views in Snowflake to enable easy querying of the raw data directly from the stages.
3. **Leverage DBT**: Use DBT macros to handle repetitive tasks, making the workflow modular and reusable.

The project focuses on the following **Mflix collections**:
- `movies`
- `comments`
- `embedded_movies`
- `users`
- `theaters`
