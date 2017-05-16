
let rec equiv x y =
  match x with | [] -> (List.hd y) = [] | h::tl -> (List.hd y) = h;;

let test = equiv [1; 2];;
