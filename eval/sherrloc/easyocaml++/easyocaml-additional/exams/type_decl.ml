(*S*)

type 'annot t = {
  annot: 'annot ;
  desc: 'annot desc ;
}
and 'annot desc =
  | A | B of 'annot t list | C of 'annot t * string


let x = { annot = 1; desc = A }
let y = { annot = 1; desc = B [] }
let z = { annot = 1; desc = C ({annot = 2; desc = A}, "asd")}
