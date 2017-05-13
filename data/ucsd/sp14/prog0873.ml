
let rec listReverse l =
  let a = [] in
  let getHead b = function | [] -> [] | x::xs -> x :: (a getHead xs) in
  getHead l;;
