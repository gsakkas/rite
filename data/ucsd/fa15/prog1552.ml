
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

let palindrome w = (explode w) = (listReverse explode w);;
