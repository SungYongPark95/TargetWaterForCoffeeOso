//
//  CheckData.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/08/25.
//

import Foundation
var ColonnaDashwoodHendon = false
var SCAE = false
var SCAFullRange = false

func circles(hardness: Int, alkalinity: Int) -> String{
    // [ Mark ] SCAFullRange Check(Green)
    if 39 <= alkalinity , alkalinity <= 41 , 15 <= hardness , hardness <= 88{
        SCAFullRange = true
    }
    
    // [ Mark ] Colonna-Dashwood & Hendon Check(Red)
    if 37 <= alkalinity, alkalinity <= 80, 46 <= hardness, hardness <= 175{
        if alkalinity == 37{
            if 46 <= hardness, hardness <= 108{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 38{
            if 47 <= hardness, hardness <= 128{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 39{
            if 48 <= hardness, hardness <= 148{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 40{
            if 48 <= hardness, hardness <= 156{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 41{
            if 49 <= hardness, hardness <= 160{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 42{
            if 49 <= hardness, hardness <= 162{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 43{
            if 50 <= hardness, hardness <= 164{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 44{
            if 51 <= hardness, hardness <= 165{ ColonnaDashwoodHendon = true}
        }else if alkalinity == 45{
            if 52 <= hardness, hardness <= 166{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 46{
            if 53 <= hardness, hardness <= 167{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 47{
            if 53 <= hardness, hardness <= 168{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 48{
            if 54 <= hardness, hardness <= 168{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 49{
            if 55 <= hardness, hardness <= 169{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 50{
            if 55 <= hardness, hardness <= 169{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 51{
            if 56 <= hardness, hardness <= 170{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 52{
            if 58 <= hardness, hardness <= 170{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 53{
            if 59 <= hardness, hardness <= 171{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 54{
            if 61 <= hardness, hardness <= 171{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 55{
            if 63 <= hardness, hardness <= 172{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 56{
            if 64 <= hardness, hardness <= 172{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 57{
            if 65 <= hardness, hardness <= 172{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 58{
            if 67 <= hardness, hardness <= 173{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 59{
            if 69 <= hardness, hardness <= 173{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 60{
            if 70 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 61{
            if 72 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 62{
            if 75 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 63{
            if 77 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 64{
            if 80 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 65{
            if 83 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 66{
            if 85 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 67{
            if 87 <= hardness, hardness <= 174{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 68{
            if 91 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 69{
            if 94 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 70{
            if 97 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 71{
            if 101 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 72{
            if 104 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 73{
            if 108 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 74{
            if 112 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 75{
            if 115 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 76{
            if 122 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 77{
            if 130 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 78{
            if 138 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else if alkalinity == 79{
            if 148 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }else{
            if 166 <= hardness, hardness <= 175{ ColonnaDashwoodHendon = true }
        }
    }
    
    // [ Mark ] SCAE Check(Blue)
    if 39 <= alkalinity, alkalinity <= 63, 54 <= hardness, hardness <= 110{
        if alkalinity == 39{
            if  54 <= hardness, hardness <= 74{ SCAE = true }
        }else if alkalinity == 40{
            if 55 <= hardness, hardness <= 75{ SCAE = true }
        }else if alkalinity == 41{
            if 55 <= hardness, hardness <= 76{ SCAE = true }
        }else if alkalinity == 42{
            if 56 <= hardness, hardness <= 78{ SCAE = true }
        }else if alkalinity == 43{
            if 57 <= hardness, hardness <= 79{ SCAE = true }
        }else if alkalinity == 44{
            if 58 <= hardness, hardness <= 82{ SCAE = true }
        }else if alkalinity == 45{
            if 59 <= hardness, hardness <= 83{ SCAE = true }
        }else if alkalinity == 46{
            if 60 <= hardness, hardness <= 85{ SCAE = true }
        }else if alkalinity == 47{
            if 60 <= hardness, hardness <= 87{ SCAE = true }
        }else if alkalinity == 48{
            if 61 <= hardness, hardness <= 88{ SCAE = true }
        }else if alkalinity == 49{
            if 62 <= hardness, hardness <= 90{ SCAE = true }
        }else if alkalinity == 50{
            if 64 <= hardness, hardness <= 92{ SCAE = true }
        }else if alkalinity == 51{
            if 65 <= hardness, hardness <= 94{ SCAE = true }
        }else if alkalinity == 52{
            if 67 <= hardness, hardness <= 95{ SCAE = true }
        }else if alkalinity == 53{
            if 69 <= hardness, hardness <= 97{ SCAE = true }
        }else if alkalinity == 54{
            if 70 <= hardness, hardness <= 99{ SCAE = true }
        }else if alkalinity == 55{
            if 72 <= hardness, hardness <= 100{ SCAE = true }
        }else if alkalinity == 56{
            if 74 <= hardness, hardness <= 103{ SCAE = true }
        }else if alkalinity == 57{
            if 75 <= hardness, hardness <= 104{ SCAE = true }
        }else if alkalinity == 58{
            if 78 <= hardness, hardness <= 106{ SCAE = true }
        }else if alkalinity == 59{
            if 81 <= hardness, hardness <= 107{ SCAE = true }
        }else if alkalinity == 60{
            if 84 <= hardness, hardness <= 110{ SCAE = true }
        }else if alkalinity == 61{
            if 86 <= hardness, hardness <= 106{ SCAE = true }
        }else if alkalinity == 62{
            if 89 <= hardness, hardness <= 101{ SCAE = true }
        }else{
            if 92 <= hardness, hardness <= 95{ SCAE = true }
        }
    }
    
    // [ MARK ] Return Circle Check
    if SCAE , ColonnaDashwoodHendon , SCAFullRange{
        return "GraphDataCircles_111"
    }else if SCAFullRange , ColonnaDashwoodHendon{
        return "GraphDataCircles_110"
    }else if ColonnaDashwoodHendon , SCAE{
        return "GraphDataCircles_101"
    }else if ColonnaDashwoodHendon{
        return "GraphDataCircles_100"
    }else if SCAFullRange{
        return "GraphDataCircles_010"
    }else{
        return "GraphDataCircles_000"
    }
}

func calcDate() -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
    let current_date_string = formatter.string(from: Date())
    return current_date_string
}
