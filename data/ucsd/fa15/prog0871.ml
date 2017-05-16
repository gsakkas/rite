
let rec clone x n =
  if n > 0 then match x with | h::t -> h @ (clone t (n - 1));;
