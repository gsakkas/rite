
let explodeInt s =
  let rec go i =
    if i >= (String.length s)
    then []
    else (int_of_char (s.[i])) :: (int_of_char go (i + 1)) in
  go 0;;
