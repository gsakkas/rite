
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listList xs =
  match explode xs with | [] -> [[]] | h::t -> [h] @ (listList t);;
