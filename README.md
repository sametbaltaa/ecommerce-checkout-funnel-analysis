# E-commerce Checkout Funnel Analysis

**Product Analytics & Product Management Case Study**

## 1. Project Overview

In this project, I analyzed an e-commerce checkout funnel using PostgreSQL and SQL.

My goal was to understand where users leave the checkout process, compare two weeks of data, and suggest a possible solution.

I used **2,000 simulated shopping sessions**. This is a synthetic dataset, not real customer data.

## 2. Tools & Skills

- PostgreSQL
- SQL (GROUP BY, COUNT DISTINCT, FILTER, DATE_TRUNC)
- Funnel Analysis
- Product Analytics
- Product Management
- Hypothesis Development

## 3. Checkout Funnel

The funnel has five steps:

1. Cart Viewed
2. Checkout Started
3. Shipping Submitted
4. Payment Attempted
5. Purchase Completed

### Overall Results

| Funnel Step        | Sessions |
| ------------------ | -------: |
| Cart Viewed        |    2,000 |
| Checkout Started   |    1,520 |
| Shipping Submitted |    1,216 |
| Payment Attempted  |      912 |
| Purchase Completed |      684 |

The overall cart-to-purchase conversion rate was **34.2%**.

The largest drop in the number of sessions happened between Cart Viewed and Checkout Started, where 480 sessions left the funnel.

## 4. Weekly Comparison

I compared two weeks of simulated data.

| Metric                      | Week of Oct 12 | Week of Oct 19 |
| --------------------------- | -------------: | -------------: |
| Cart Sessions               |          1,000 |          1,000 |
| Checkout Sessions           |            820 |            700 |
| Cart-to-Checkout Conversion |            82% |            70% |
| Cart-to-Checkout Drop-off   |            18% |            30% |

The cart-to-checkout drop-off rate increased from **18% to 30%**, a change of 12 percentage points.

This was the main problem I decided to investigate.

## 5. Segment Analysis

I compared the results by device type, user type, and traffic source.

- **Device:** Mobile and desktop both showed an increase of about 12 percentage points in drop-off.
- **User Type:** New and returning users both showed the same increase.
- **Traffic Source:** Direct, organic, and paid ads showed similar changes.

I did not find one segment with a clearly larger increase.

These results are affected by the rules used to generate the synthetic dataset. They should not be treated as evidence of real customer behavior.

## 6. Problem Statement

The analysis showed that cart-to-checkout drop-off increased from 18% to 30% between two weeks.

The problem appeared across different user groups and devices.

This could reduce the number of completed purchases, so I decided to investigate the cart-to-checkout step.

## 7. My Hypothesis

I hypothesize that a recent application update may have introduced technical friction between the cart and checkout stages, causing more users to abandon their carts before starting checkout.

This is a hypothesis, not a confirmed cause.

## 8. How I Would Investigate

First, I would check the application update history to see if there was a recent release.

Then, I would compare technical errors and checkout page loading times before and after the update.

I would also check whether users clicked the checkout button but could not open the checkout page.

This extra information is not available in the current dataset.

## 9. Proposed Solution

If we find a technical problem after the recent update, I would work with the development team to fix it.

If necessary, we could return to the previous version of the application.

After the fix, I would check the conversion rate and error rate to see if the problem is solved.

## 10. Success Metrics

**Primary Metric:** Cart-to-checkout conversion rate

- Baseline: 70%
- Target: At least 82%

**Secondary Metric:** Cart-to-checkout technical error rate

**Guardrail:** Overall purchase completion rate

My target would be to bring cart-to-checkout conversion back to the previous week's level without making the overall purchase completion rate worse.

The target is a proposed goal, not a measured result.

## 11. Limitations

This project uses synthetic data created with predefined rules.

The weekly differences were built into the dataset, and the segment results are influenced by how the data was generated.

I cannot confirm the reason for the increase in drop-off with this data alone.

In a real product, I would need application logs, release information, and more user behavior data before making a final decision.

## 12. Project Files

- `schema.sql` — Creates the checkout events table
- `seed_data.sql` — Generates the synthetic dataset
- `analysis.sql` — Contains the SQL analysis queries

## 13. Conclusion

This project helped me practice using SQL to understand a product problem.

I analyzed the checkout funnel, compared user segments, developed a hypothesis, and suggested how to investigate and measure a possible solution.

My main takeaway is that **data can show where a problem happens, but we need more evidence to understand why it happens.**
