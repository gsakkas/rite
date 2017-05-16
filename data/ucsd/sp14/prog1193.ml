
let rec clone x n =
  match n > 0 with | true  -> x :: ((clone x n) - 1) | false  -> x;;
