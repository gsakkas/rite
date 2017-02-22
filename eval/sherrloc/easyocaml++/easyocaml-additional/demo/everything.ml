

let rec g : int -> int =
  fun y -> f 3.0 + f y
and f : int -> int =
  fun x -> x

let h = function
  | [] -> 0
  | _ :: rem -> 1 + h rem

let fst_of_3 (x, _, _) = x

let divmod n m = (n / m, n mod m)

let _ = fst_of_3 (divmod 14 5)
