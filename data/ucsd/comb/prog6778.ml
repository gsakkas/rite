
let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> ""
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> (h "; ") ^ (makeString t) in
      "[" ^ ((makeString l') ^ "]");;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
