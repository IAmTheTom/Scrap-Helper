# Price Sources

## Purpose

Scrap Helper must distinguish current local yard prices from generic internet estimates.

## Source Priority

1. Actual current receipt
2. Current official yard price sheet or website
3. Direct phone or in-person confirmation
4. Recent user-entered observed price
5. General regional reference
6. Broad internet estimate

## Required Price Record Fields

- yard;
- canonical category;
- yard category name;
- rate;
- rate unit;
- effective date;
- source type;
- source note;
- preparation requirement;
- fee or deduction;
- active status.

## Rules

- Never overwrite historical prices.
- Add a new effective-dated record.
- Preserve the unit quoted by the yard.
- Mark unconfirmed rates clearly.
- Do not use a national average as though it were the EH Recycling price.
- A receipt-confirmed price outranks an older website listing for that transaction.
