
let rec append list1 list2 =
  match list1 with | [] -> list2 | x::xs -> x :: (append xs list2);;

let _ = append [(2, 3, 4)] [1];;
