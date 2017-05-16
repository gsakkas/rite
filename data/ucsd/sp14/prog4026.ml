
let rec digitsOfInt n =
  let s = string_of_int n in
  let s2 = String.length s in
  for i = 0 to (s2 - 1) / 2 do
    (let c = s2.[i] in s2.[i] <- s2.[(n - i) - 1]; s2.[(n - i) - 1] <- c)
  done;
  int_of_string s2;;
