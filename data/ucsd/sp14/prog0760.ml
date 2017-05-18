
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec digitsOfInt n =
  if n <= 0 then [] else int_of_char explode (string_of_int n);;
