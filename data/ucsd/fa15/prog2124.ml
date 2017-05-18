
let rec wwhile (f,b) =
  match f b with | (f,(h1,h2)) -> if h2 then wwhile (f, (h1, h2)) else h1;;
