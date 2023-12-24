# Startup Investments

In this project we are going to be working with the database storing the information about venture capital funds and investments in start-up companies. The database is based on [Startup Investments](https://www.kaggle.com/datasets/justinas/startup-investments) dataset published on Kaggle.

## Database

The databased is composed of the following seven interlinked tables:

1. [`acquisition`](#acquisition)
2. [`company`](#company)
3. [`education`](#education)
4. [`fund`](#fund)
5. [`funding_round`](#funding_round)
6. [`investment`](#investment)
7. [`people`](#people)

## Database tables and fields

### `acquisition`

This table contains information about the acquisitions of companies:

| Key | Field | Description | 
| :---------------------- | :---------------------- | :---------------------- |
| *PK* | `id` | Unique acquisition number |
| *FK* | `acquiring_company_id` | Identifier of an acquiring company |
| *FK* | `acquired_company_id` | Identifier of an acquired company |
| | `term_code` | Acquisition payment method |
| | `price_amount` | Acquisition amount (USD) |
| | `created_at` | Date and time of creating a table entry |
| | `updated_at` | Date and time of updating a table entry |

> `acquisition` table is linked to [`company`](#company) table (`id` field) via `acquiring_company_id` and `acquired_company_id`.

#### Remarks

Some fields have a limited number of categories, for instance:

- `term_code`
    - `cash` - in cash
    - `stock` - in company stock
    - `cash_and_stock` - mixed payment method: cash/stocks

---

### `company`

The table stores information about the start-up companies:

| Key | Field | Description | 
| :---------------------- | :---------------------- | :---------------------- |
| *PK* | `id` | Company identifier |
| | `name` | Company name |
| | `category_code` | Company activity category |
| | `status` | Company status |
| | `founded_at` | Date of founding a company |
| | `closed_at` | Date of a company closure (if a company does not exist anymore) |
| | `domain` | Domain of a company website |
| | `network_username` | Fund profile in a corporate stock exchange network |
| | `country_code` | Country code (`USA`, `GBR` or others)|
| | `investment_rounds` | Number of rounds where a company participated in as an investor |
| | `funding_rounds` | Number of rounds in which a company was raising funds |
| | `funding_total` | Amount raised (USD) |
| | `milestones` | Number of important stages in a company history |
| | `created_at` | Date and time of creating a table entry |
| | `updated_at` | Date and time of updating a table entry |

> `company` table is linked to [`acquisitions`](#acquisition), [`funding_round`](#funding_round), [`investment`](#investment) and [`people`](#people) tables via a Primary Key.

#### Remarks

The following fields have a limited number of values:

- `category_code`
    - `news` - engages in working with news
    - `social` - engages in social work

- `status`
    - `acquired` - an acquired company
    - `operating` - a functioning company
    - `ipo` - a company launching an IPO
    - `closed` - a closed company

---

### `education`

The table contains information about the education of companies employees:

| Key | Field | Description | 
| :---------------------- | :---------------------- | :---------------------- |
| *PK* | `id` | Education information identifier |
| *FK* | `person_id` | Identifier of a person |
| | `degree_type` | Degree of a person |
| | `instituition` | Name of a university |
| | `graduated_at` | Date of graduation |
| | `created_at` | Date and time of creating a table entry |
| | `updated_at` | Date and time of updating a table entry |

> `education` table is linked to [`people`](#people) table (`id` field) via `person_id`.

#### Remarks

- `degree_type`
    - `BA` - Bachelor of Arts
    - `MS` - Master of Science

---

### `fund`

The table stores information about the venture funds:

| Key | Field | Description | 
| :---------------------- | :---------------------- | :---------------------- |
| *PK* | `id` | Venture fund identifier |
| | `name` | Venture fund name |
| | `founded_at` | Date of founding a fund |
| | `domain` | Domain of a venture fund website |
| | `network_username` | Fund profile in a corporate stock exchange network |
| | `country_code` | Country code of a fund|
| | `investment_rounds` | Number of rounds where a fund participated in as an investor |
| | `invested_companies` | Number of companies in which a fund made an investment |
| | `milestones` | Number of important stages in a fund history |
| | `created_at` | Date and time of creating a table entry |
| | `updated_at` | Date and time of updating a table entry |

> `fund` table is linked to [`investment`](#investment) table via a Primary Key.

---

### `funding_round`

The table includes information about the investment rounds:

| Key | Field | Description | 
| :---------------------- | :---------------------- | :---------------------- |
| *PK* | `id` | Investment round identifier |
| *FK* | `company_id` | Unique company identifier |
| | `funded_at` | Date of an investment round |
| | `funding_round_type` | Investment round type |
| | `raised_amount` | Investment raised in a particular round (USD) |
| | `pre_money_valuation` | Preliminary company valuation |
| | `participants` | Number of people participating in an investment round |
| | `is_first_round` | Identifier of whether a round is the first for a company |
| | `is_last_round` | Identifier of whether a round is the last for a company |
| | `created_at` | Date and time of creating a table entry |
| | `updated_at` | Date and time of updating a table entry |

> `funding_round` table is linked to [`company`](#company) table (`id` field) via `company_id` and to [`investment`](#investment) via a Primary Key.

#### Remarks

- `funding_round_type`
    - `venture` - venture round
    - `angel` - angel round
    - `series_a` - Series A round

---

### `investment`

The table has information about the investments of venture funds in start-up companies:

| Key | Field | Description | 
| :---------------------- | :---------------------- | :---------------------- |
| *PK* | `id` | Unique investment identifier |
| *FK* | `funding_round_id` | Investment round identifier |
| *FK* | `company_id` | Unique company identifier |
| *FK* | `fund_id` | Unique fund identifier |
| | `created_at` | Date and time of creating a table entry |
| | `updated_at` | Date and time of updating a table entry |

> `investment` table is linked to [`funding_round`](#funding_round) table (`id` field) via `funding_round_id`. The table is also linked to [`company`](#company) table (`id` field) via `company_id` and to [`fund`](#fund) table (`id` field) via `fund_id`.

---

### `people`

The table stores information about the employees of companies:

| Key | Field | Description | 
| :---------------------- | :---------------------- | :---------------------- |
| *PK* | `id` | Unique employee identifier |
| | `first_name` | Employee name |
| | `last_name` | Employee surname |
| *FK* | `company_id` | Unique company identifier |
| | `network_username` | Fund profile in a corporate stock exchange network |
| | `created_at` | Date and time of creating a table entry |
| | `updated_at` | Date and time of updating a table entry |

> `people` table is linked to [`company`](#company) table (`id` field) via `company_id` and to [`education`](#education) via a Primary Key.

---

[Back to top](#startup-investments)
