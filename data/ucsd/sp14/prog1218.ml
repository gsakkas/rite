
let rec build (rand,depth) =
  if depth = 0
  then
    let x = rand (1, 10) in
    match x with | 1..5 -> buildY () | 6..10 -> buildX ()
  else
    (let x = rand (1, 10) in
     match x with
     | 6|1 -> buildSine (build (rand, (depth - 1)))
     | 7|2 -> buildCosine (build (rand, (depth - 1)))
     | 9|3 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 10|4 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 8|5 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;
