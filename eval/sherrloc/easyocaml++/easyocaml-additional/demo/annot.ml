let rec g : int -> int =
  fun y -> f 3.0 + f y
and f : int -> int =
  fun x -> x
