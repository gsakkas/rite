
let rec reverse s =
  let n = String.length s in
  for i = 0 to (n - 1) / 2 do
    (let c = s.[i] in s.[i] <- s.[(n - i) - 1]; s.[(n - i) - 1] <- c)
  done;
  s;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = int_of_string reverse (string_of_int n)
     and y = x / 10
     and z = x mod 10 in
     if (y = 0) && (z = 0) then [] else z :: (digitsOfInt y));;
