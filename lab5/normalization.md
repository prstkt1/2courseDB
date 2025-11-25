# Лабораторна робота 5: Нормалізація бази даних

## 1. Аналіз функціональних залежностей (Functional Dependencies)

### Таблиця: Payment

- **PK:** `payment_id`
- **FD1:** $payment\_id \to payment\_date, amount, order\_id$
- **FD2 (Слабка):** $payment\_id \to method$
  - _Пояснення:_ Атрибут `method` містить повторювані текстові значення ("Cash", "Card"). Хоча технічно це залежить від ключа, семантично це посилання на сутність "Тип оплати".

---

## 2. Перевірка нормальних форм та Нормалізація

### Крок 1: 1NF

**Вимога:** Усі атрибути атомарні, немає повторюваних груп.

- **Аналіз:** Усі таблиці (`Customer`, `Product` тощо) мають скалярні значення. Масивів або списків немає.
- **Висновок:** Схема вже відповідає 1NF.

### Крок 2: 2NF

**Вимога:** Таблиця в 1NF і всі неключові атрибути залежать від _повного_ первинного ключа.

- **Аналіз:** Оскільки використовуются сурогатні ключі (`SERIAL PRIMARY KEY`) для всіх таблиць, немає складених первинних ключів, де атрибут міг би залежати лише від частини ключа.
- **Висновок:** Схема автоматично відповідає 2NF.

### Крок 3: 3NF

**Вимога:** Таблиця в 2NF і немає транзитивних залежностей (неключовий атрибут не повинен залежати від іншого неключового атрибута).

#### Проблема: Повторювані рядки в `Payment`

У таблиці `Payment` поле `method` містить повторювані рядки ("Card", "Cash").

- **Порушення:** Це не суворе порушення 3NF, але це поганий дизайн, який веде до аномалій вставки (можливість помилок у написанні).
- **Рішення:** Створити таблицю `PaymentMethod` і замінити поле `method` на зовнішній ключ `payment_method_id`.

---

## 3. SQL Changes

### Таблиця Payment (Виділення довідника)

**Нова таблиця:**

```sql
CREATE TABLE PaymentMethod (
    payment_method_id SERIAL PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE
);
```

**Модифікація Payment:**

```sql
-- 1.
ALTER TABLE Payment ADD COLUMN payment_method_id INT;

-- 2.
INSERT INTO PaymentMethod (method_name) VALUES ('Cash'), ('Credit Card'), ('PayPal');

-- 3.
ALTER TABLE Payment
    ADD CONSTRAINT fk_payment_method
    FOREIGN KEY (payment_method_id)
    REFERENCES PaymentMethod(payment_method_id);

-- 4.
ALTER TABLE Payment DROP COLUMN method;
```

```

```
