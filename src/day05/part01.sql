WITH RECURSIVE steps AS (
  SELECT
      (ROW_NUMBER() OVER (ORDER BY id, x))::int id
    , (arr[4])::int from_
    , (arr[6])::int to_
  FROM day05_moves
    , regexp_split_to_array(description, '\s+') arr
    , GENERATE_SERIES(1, arr[2]::INT) x
)
, rec AS (
  SELECT
      0 id
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
    , ARRAY[0] path_
    , cardinality(c1)
      + cardinality(c2)
      + cardinality(c3)
      + cardinality(c4)
      + cardinality(c5)
      + cardinality(c6)
      + cardinality(c7)
      + cardinality(c8)
      + cardinality(c9) total_crates
  FROM day05_position

  UNION ALL

  SELECT
      steps.id
    , steps.from_
    , steps.to_
    , CASE
        WHEN steps.from_ = 1 then c1[1:cardinality(c1)-1]
        WHEN steps.from_ = 2 and steps.to_ = 1 tHEN c1 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 and steps.to_ = 1 tHEN c1 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 and steps.to_ = 1 tHEN c1 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 and steps.to_ = 1 tHEN c1 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 and steps.to_ = 1 tHEN c1 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 and steps.to_ = 1 tHEN c1 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 and steps.to_ = 1 tHEN c1 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 and steps.to_ = 1 tHEN c1 || c9[cardinality(c9)]
        ELSE c1
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 2 then c2 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 then c2[1:cardinality(c2)-1]
        WHEN steps.from_ = 3 and steps.to_ = 2 tHEN c2 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 and steps.to_ = 2 tHEN c2 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 and steps.to_ = 2 tHEN c2 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 and steps.to_ = 2 tHEN c2 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 and steps.to_ = 2 tHEN c2 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 and steps.to_ = 2 tHEN c2 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 and steps.to_ = 2 tHEN c2 || c9[cardinality(c9)]
        ELSE c2
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 3 then c3 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 and steps.to_ = 3 tHEN c3 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 then c3[1:cardinality(c3)-1]
        WHEN steps.from_ = 4 and steps.to_ = 3 tHEN c3 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 and steps.to_ = 3 tHEN c3 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 and steps.to_ = 3 tHEN c3 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 and steps.to_ = 3 tHEN c3 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 and steps.to_ = 3 tHEN c3 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 and steps.to_ = 3 tHEN c3 || c9[cardinality(c9)]
        ELSE c3
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 4 then c4 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 and steps.to_ = 4 tHEN c4 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 and steps.to_ = 4 tHEN c4 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 then c4[1:cardinality(c4)-1]
        WHEN steps.from_ = 5 and steps.to_ = 4 tHEN c4 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 and steps.to_ = 4 tHEN c4 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 and steps.to_ = 4 tHEN c4 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 and steps.to_ = 4 tHEN c4 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 and steps.to_ = 4 tHEN c4 || c9[cardinality(c9)]
        ELSE c4
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 5 then c5 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 and steps.to_ = 5 tHEN c5 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 and steps.to_ = 5 tHEN c5 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 and steps.to_ = 5 tHEN c5 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 then c5[1:cardinality(c5)-1]
        WHEN steps.from_ = 6 and steps.to_ = 5 tHEN c5 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 and steps.to_ = 5 tHEN c5 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 and steps.to_ = 5 tHEN c5 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 and steps.to_ = 5 tHEN c5 || c9[cardinality(c9)]
        ELSE c5
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 6 then c6 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 and steps.to_ = 6 tHEN c6 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 and steps.to_ = 6 tHEN c6 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 and steps.to_ = 6 tHEN c6 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 and steps.to_ = 6 tHEN c6 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 then c6[1:cardinality(c6)-1]
        WHEN steps.from_ = 7 and steps.to_ = 6 tHEN c6 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 and steps.to_ = 6 tHEN c6 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 and steps.to_ = 6 tHEN c6 || c9[cardinality(c9)]
        ELSE c6
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 7 then c7 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 and steps.to_ = 7 tHEN c7 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 and steps.to_ = 7 tHEN c7 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 and steps.to_ = 7 tHEN c7 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 and steps.to_ = 7 tHEN c7 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 and steps.to_ = 7 tHEN c7 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 then c7[1:cardinality(c7)-1]
        WHEN steps.from_ = 8 and steps.to_ = 7 tHEN c7 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 and steps.to_ = 7 tHEN c7 || c9[cardinality(c9)]
        ELSE c7
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 8 then c8 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 and steps.to_ = 8 tHEN c8 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 and steps.to_ = 8 tHEN c8 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 and steps.to_ = 8 tHEN c8 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 and steps.to_ = 8 tHEN c8 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 and steps.to_ = 8 tHEN c8 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 and steps.to_ = 8 tHEN c8 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 then c8[1:cardinality(c8)-1]
        WHEN steps.from_ = 9 and steps.to_ = 8 tHEN c8 || c9[cardinality(c9)]
        ELSE c8
      END
    , CASE
        WHEN steps.from_ = 1 and steps.to_ = 9 then c9 || c1[cardinality(c1)]
        WHEN steps.from_ = 2 and steps.to_ = 9 tHEN c9 || c2[cardinality(c2)]
        WHEN steps.from_ = 3 and steps.to_ = 9 tHEN c9 || c3[cardinality(c3)]
        WHEN steps.from_ = 4 and steps.to_ = 9 tHEN c9 || c4[cardinality(c4)]
        WHEN steps.from_ = 5 and steps.to_ = 9 tHEN c9 || c5[cardinality(c5)]
        WHEN steps.from_ = 6 and steps.to_ = 9 tHEN c9 || c6[cardinality(c6)]
        WHEN steps.from_ = 7 and steps.to_ = 9 tHEN c9 || c7[cardinality(c7)]
        WHEN steps.from_ = 8 and steps.to_ = 9 tHEN c9 || c8[cardinality(c8)]
        WHEN steps.from_ = 9 then c9[1:cardinality(c9)-1]
        ELSE c9
      END
    , path_ || steps.id
    , cardinality(c1)
      + cardinality(c2)
      + cardinality(c3)
      + cardinality(c4)
      + cardinality(c5)
      + cardinality(c6)
      + cardinality(c7)
      + cardinality(c8)
      + cardinality(c9) total_crates
  FROM rec
  JOIN steps
    ON steps.id = rec.id + 1
)

SELECT
    id
  , from_
  , to_
  , c1
  , c2
  , c3
  , c4
  , c5
  , c6
  , c7
  , c8
  , c9
  , c1[cardinality(c1)]
    || c2[cardinality(c2)]
    || c3[cardinality(c3)]
    || c4[cardinality(c4)]
    || c5[cardinality(c5)]
    || c6[cardinality(c6)]
    || c7[cardinality(c7)]
    || c8[cardinality(c8)]
    || c9[cardinality(c9)] stack_tops
  , total_crates
FROM rec
WHERE id = (SELECT MAX(id) FROM rec)
