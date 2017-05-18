
let rec reverse s =
  let n = String.length s in
  for i = 0 to (n - 1) / 2 do
    (let c = s.[i] in s.[i] <- s.[(n - i) - 1]; s.[(n - i) - 1] <- c)
  done;
  int_of_string s;;

let z = 0;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if z = 0
    then (let n2 = reverse (string_of_int n)
          and z = 1 in digitsOfInt n2);;
