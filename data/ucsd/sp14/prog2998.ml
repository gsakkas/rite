
let change x =
  let rec changehelper acc x =
    match x with
    | [] -> []
    | hd::tl -> changehelper (acc ^ (int_of_string hd)) tl in
  changehelper "" x;;
