
let rec clone x n =
  match n = 0 with | true  -> x | false  -> x @ ((clone x n) - 1);;
