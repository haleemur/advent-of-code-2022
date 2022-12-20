WITH RECURSIVE rec AS (
  SELECT
      0 id
    , 0 crates
    , 0 from_
    , 0 to_
    , c1
    , c2
    , c3
    , c4
    , c5
    , c6
    , c7
    , c8
    , c9
  FROM day05_position

  UNION ALL

  SELECT
    steps.id
  , steps.crates
  , steps.from_
  , steps.to_
  , CASE
      WHEN steps.from_ = 1 then c1[1:cardinality(c1)-steps.crates]
      WHEN steps.from_ = 2 and steps.to_ = 1 tHEN c1 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 and steps.to_ = 1 tHEN c1 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 and steps.to_ = 1 tHEN c1 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 and steps.to_ = 1 tHEN c1 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 and steps.to_ = 1 tHEN c1 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 and steps.to_ = 1 tHEN c1 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 and steps.to_ = 1 tHEN c1 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 and steps.to_ = 1 tHEN c1 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c1
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 2 then c2 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 then c2[1:cardinality(c2)-steps.crates]
      WHEN steps.from_ = 3 and steps.to_ = 2 tHEN c2 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 and steps.to_ = 2 tHEN c2 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 and steps.to_ = 2 tHEN c2 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 and steps.to_ = 2 tHEN c2 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 and steps.to_ = 2 tHEN c2 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 and steps.to_ = 2 tHEN c2 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 and steps.to_ = 2 tHEN c2 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c2
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 3 then c3 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 and steps.to_ = 3 tHEN c3 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 then c3[1:cardinality(c3)-steps.crates]
      WHEN steps.from_ = 4 and steps.to_ = 3 tHEN c3 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 and steps.to_ = 3 tHEN c3 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 and steps.to_ = 3 tHEN c3 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 and steps.to_ = 3 tHEN c3 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 and steps.to_ = 3 tHEN c3 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 and steps.to_ = 3 tHEN c3 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c3
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 4 then c4 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 and steps.to_ = 4 tHEN c4 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 and steps.to_ = 4 tHEN c4 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 then c4[1:cardinality(c4)-steps.crates]
      WHEN steps.from_ = 5 and steps.to_ = 4 tHEN c4 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 and steps.to_ = 4 tHEN c4 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 and steps.to_ = 4 tHEN c4 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 and steps.to_ = 4 tHEN c4 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 and steps.to_ = 4 tHEN c4 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c4
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 5 then c5 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 and steps.to_ = 5 tHEN c5 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 and steps.to_ = 5 tHEN c5 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 and steps.to_ = 5 tHEN c5 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 then c5[1:cardinality(c5)-steps.crates]
      WHEN steps.from_ = 6 and steps.to_ = 5 tHEN c5 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 and steps.to_ = 5 tHEN c5 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 and steps.to_ = 5 tHEN c5 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 and steps.to_ = 5 tHEN c5 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c5
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 6 then c6 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 and steps.to_ = 6 tHEN c6 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 and steps.to_ = 6 tHEN c6 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 and steps.to_ = 6 tHEN c6 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 and steps.to_ = 6 tHEN c6 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 then c6[1:cardinality(c6)-steps.crates]
      WHEN steps.from_ = 7 and steps.to_ = 6 tHEN c6 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 and steps.to_ = 6 tHEN c6 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 and steps.to_ = 6 tHEN c6 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c6
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 7 then c7 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 and steps.to_ = 7 tHEN c7 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 and steps.to_ = 7 tHEN c7 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 and steps.to_ = 7 tHEN c7 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 and steps.to_ = 7 tHEN c7 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 and steps.to_ = 7 tHEN c7 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 then c7[1:cardinality(c7)-steps.crates]
      WHEN steps.from_ = 8 and steps.to_ = 7 tHEN c7 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 and steps.to_ = 7 tHEN c7 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c7
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 8 then c8 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 and steps.to_ = 8 tHEN c8 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 and steps.to_ = 8 tHEN c8 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 and steps.to_ = 8 tHEN c8 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 and steps.to_ = 8 tHEN c8 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 and steps.to_ = 8 tHEN c8 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 and steps.to_ = 8 tHEN c8 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 then c8[1:cardinality(c8)-steps.crates]
      WHEN steps.from_ = 9 and steps.to_ = 8 tHEN c8 || c9[cardinality(c9)-steps.crates+1:cardinality(c9)]
      ELSE c8
    END
  , CASE
      WHEN steps.from_ = 1 and steps.to_ = 9 then c9 || c1[cardinality(c1)-steps.crates+1:cardinality(c1)]
      WHEN steps.from_ = 2 and steps.to_ = 9 tHEN c9 || c2[cardinality(c2)-steps.crates+1:cardinality(c2)]
      WHEN steps.from_ = 3 and steps.to_ = 9 tHEN c9 || c3[cardinality(c3)-steps.crates+1:cardinality(c3)]
      WHEN steps.from_ = 4 and steps.to_ = 9 tHEN c9 || c4[cardinality(c4)-steps.crates+1:cardinality(c4)]
      WHEN steps.from_ = 5 and steps.to_ = 9 tHEN c9 || c5[cardinality(c5)-steps.crates+1:cardinality(c5)]
      WHEN steps.from_ = 6 and steps.to_ = 9 tHEN c9 || c6[cardinality(c6)-steps.crates+1:cardinality(c6)]
      WHEN steps.from_ = 7 and steps.to_ = 9 tHEN c9 || c7[cardinality(c7)-steps.crates+1:cardinality(c7)]
      WHEN steps.from_ = 8 and steps.to_ = 9 tHEN c9 || c8[cardinality(c8)-steps.crates+1:cardinality(c8)]
      WHEN steps.from_ = 9 then c9[1:cardinality(c9)-steps.crates]
      ELSE c9
    END
  FROM rec
  JOIN day05_steps02 steps
    ON steps.id = rec.id + 1
)
SELECT
    c1[cardinality(c1)]
    || c2[cardinality(c2)]
    || c3[cardinality(c3)]
    || c4[cardinality(c4)]
    || c5[cardinality(c5)]
    || c6[cardinality(c6)]
    || c7[cardinality(c7)]
    || c8[cardinality(c8)]
    || c9[cardinality(c9)] stack_tops
FROM rec
WHERE id = (SELECT max(id) FROM rec)
