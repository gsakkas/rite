
let rec clone x n = if n <= 0 then x else clone (List.append x x) (n - 1);;

let _ = clone clone (-3);;
