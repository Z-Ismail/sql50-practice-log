-- ===================================
-- 🔹 Q01: Recyclable and Low Fat Products
-- ===================================

-- Question:
-- Write a solution to find the ids of products that are both low fat and recyclable.
-- 
-- Table: Products
-- +-------------+----------+-------------+
-- | product_id  | low_fats | recyclable  |
-- +-------------+----------+-------------+
-- |    int      | enum(Y/N)| enum(Y/N)   |

-- Notes:
-- product_id is the primary key.
-- low_fats = 'Y' means low fat. recyclable = 'Y' means recyclable.

-- Brainstorm:
-- Pretty straightforward — just need to filter for rows where both conditions are 'Y'.
-- No joins or grouping needed, just a simple WHERE clause with AND.

-- Final Answer:
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';



-- ===================================
-- 🔹 Q02: Find Customer Referee
-- ===================================

-- Question:
-- Find the names of customers who were not referred by the customer with id = 2.

-- Table: Customer
-- +----+--------+-------------+
-- | id | name   | referee_id  |
-- +----+--------+-------------+
-- | int | varchar | int       |

-- Notes:
-- Each row represents a customer and the id of the person who referred them (if any).
-- We need customers where referee_id ≠ 2 or is NULL.

-- Brainstorm:
-- Simple WHERE clause — exclude rows where referee_id = 2.
-- Gotta remember to include those with NULL referee_id too, since they weren’t referred at all.
-- So we use: `referee_id != 2 OR referee_id IS NULL`.

-- Final Answer:
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;



-- ===================================
-- 🔹 Q03: Big Countries
-- ===================================

-- Question:
-- A country is considered big if:
-- - it has an area of at least three million km² (area >= 3000000), OR
-- - it has a population of at least twenty-five million (population >= 25000000).
-- 
-- Write a query to return the name, population, and area of the big countries.

-- Table: World
-- +-----------+-----------+--------+------------+--------------+
-- | name      | continent | area   | population | gdp          |
-- +-----------+-----------+--------+------------+--------------+

-- Brainstorm:
-- Straightforward filter with two OR conditions on `area` and `population`.
-- Only need to return name, population, and area — ignore the rest.
-- Don’t need DISTINCT or sorting since output can be in any order.

-- Final Answer:
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;


-- ===================================
-- 🔹 Q04: Article Views I
-- ===================================

-- Question:
-- Find all authors who have viewed at least one of their own articles.

-- Table: Views
-- +------------+-----------+------------+------------+
-- | article_id | author_id | viewer_id  | view_date  |
-- +------------+-----------+------------+------------+

-- Notes:
-- Each row represents a view of an article written by author_id.
-- If viewer_id == author_id, that means the author viewed their own article.
-- Return only the author_id values and sort by id ascending.

-- Brainstorm:
-- We're looking for rows where author_id = viewer_id.
-- Add DISTINCT in case the same author viewed multiple of their own articles.
-- Final result should be sorted by id.

-- Final Answer:
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;


-- ===================================
-- 🔹 Q05: Invalid Tweets
-- ===================================

-- Question:
-- Find the IDs of tweets that are invalid.
-- A tweet is invalid if the number of characters in its content is strictly greater than 15.

-- Table: Tweets
-- +----------+----------+
-- | tweet_id | content  |
-- +----------+----------+
-- |   int    | varchar  |

-- Notes:
-- tweet_id is the primary key.
-- We’re just checking the length of the content string.

-- Brainstorm:
-- Use LENGTH(content) to check the character count.
-- Strictly greater than 15 → use `> 15` (not >=).
-- Only need to return tweet_id. No sorting needed.

-- Final Answer:
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;