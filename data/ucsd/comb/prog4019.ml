
let rec reverse s =
  let n = String.length s in
  for i = 0 to (n - 1) / 2 do
    (let c = s.[i] in s.[i] <- s.[(n - i) - 1]; s.[(n - i) - 1] <- c)
  done;
  s;;

let x = "123";;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let s = reverse (string_of_int n) in
     let n2 = int_of_string s
     and z = x mod 10 in
     if (y = 0) && (z = 0) then [] else z :: (digitsOfInt y));;
