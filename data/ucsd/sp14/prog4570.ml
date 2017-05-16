
let explodeInt n =
  let rec go i =
    if i >= (String.length (string_of_int n))
    then []
    else (n / (1 Ei)) :: (go / (1 E (i - 1))) in
  go 0;;
