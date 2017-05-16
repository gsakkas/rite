
let explodeInt s =
  let rec go i =
    if i >= (String.length s)
    then []
    else (int_of_string (s.[i])) :: (int_of_string go (i + 1)) in
  go 0;;
