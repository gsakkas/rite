
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then f h1 else wwhile (h1, h2);;
