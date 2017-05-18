
let rec wwhile (f,b) =
  match (f, b) with
  | (func,param) -> if param = true then f param else 0
  | _ -> b;;
