(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no))
	   
(defrule engine-capacity ""
   (not (engine-starts ?))
   (not (car ?))
   =>
   (assert (enginecapacity (yes-or-no-p "Is the engine capacity greater than 1.150 (yes/no)? "))))
   
(defrule wheelbase ""
   (enginecapacity yes)
   (not (car ?))
   =>
   (assert (wheelbase (yes-or-no-p "Is the wheelbase greater than 2417.5 (yes/no)? "))))
 
(defrule platform-GeelyNL ""
   (wheelbase yes)
   (not (car ?))
   =>
   (assert (platformGeelyNL (yes-or-no-p "Is the platform = Geely NL (yes/no)? "))))
   
(defrule platform-GeelyNL-NO ""
	(platformGeelyNL no)
	(not (car ?))
   =>
   (assert (platformHondaCP (yes-or-no-p "Is the platform = Honda CP (yes/no)? "))))

(defrule platformHondaCP-YES ""
	(platformHondaCP yes)
	(not (car ?))
	=>
	(assert (manufactureYear (yes-or-no-p "Is the manufacture year > 2014 (yes/no)? "))))

(defrule platformHondaCP-NO ""
	(platformHondaCP no)
	(not (car ?))
	=>
	(assert (platformMitsubishiCA (yes-or-no-p "Is the platform = Mitsubishi CA (yes/no)? "))))

(defrule platform-mitsubishi-ca-NO ""
	(platformMitsubishiCA no)
	(not (car ?))
	=>
	(assert (platformMitsubishiCB (yes-or-no-p "Is the platform = Mitsubishi CB (yes/no)? "))))

(defrule platform-mitsubishi-cb-NO ""
	(platformMitsubishiCB no)
	(not (car ?))
	=>
	(assert (platformMitsubishiCC (yes-or-no-p "Is the platform = Mitsubishi CC (yes/no)? "))))

(defrule platform-mitsubishi-cc-NO ""
	(platformMitsubishiCC no)
	(not (car ?))
	=>
	(assert (platformMitsubishiDA (yes-or-no-p "Is the platform = Mitsubishi DA (yes/no)? "))))
	
(defrule platform-mitsubishi-da-NO ""
	(platformMitsubishiCC no)
	(not (car ?))
	=>
	(assert (platformMitsubishiE50 (yes-or-no-p "Is the platform = Mitsubishi E50 (yes/no)? "))))
	
(defrule platform-mitsubishi-e50-NO ""
	(platformMitsubishiE50 no)
	(not (car ?))
	=>
	(assert (platformMitsubishiGS (yes-or-no-p "Is the platform = Mitsubishi GS (yes/no)? "))))

(defrule platform-mitsubishi-gs-NO ""
	(platformMitsubishiGS no)
	(not (car ?))
	=>
	(assert (platformProtonBH (yes-or-no-p "Is the platform = Proton BH (yes/no)? "))))
	
(defrule platform-Proton-BH-YES ""
	(platformProtonBH yes)
	(not (car ?))
	=>
	(assert (BodyStyle (yes-or-no-p "Select BodyStyle YOU LIKE: Hatchback = yes, Sedan = no (yes/no)? "))))
	
(defrule platform-Proton-BH-NO ""
	(platformProtonBH no)
	(not (car ?))
	=>
	(assert (platformProtonBS (yes-or-no-p "Is the platform = Proton BS (yes/no)? "))))
	
(defrule platform-Proton-BS-NO ""
	(platformProtonBS no)
	(not (car ?))
	=>
	(assert (platformProtonBT (yes-or-no-p "Is the platform = Proton BT (yes/no)? "))))
	
(defrule platform-Proton-BT-YES ""
	(platformProtonBT yes)
	(not (car ?))
	=>
	(assert (gearCount (yes-or-no-p "Is gearCount > 4.5 (yes/no)? "))))
	
(defrule gearCount-greater-than-4.5 ""
	(gearCount yes)
	(not (car ?))
	=>
	(assert (transmissionType (yes-or-no-p "Select type of transmission you like: CVT = yes, Manual = no (yes/no)? "))))

(defrule transmissionType-Manual ""
	(transmissionType no)
	(not (car ?))
	=>
	(assert (ProtonBtEngineCapacity (yes-or-no-p "Is engine capacity > 1.450 (yes/no)? "))))
	
(defrule platform-Proton-BT-NO ""
	(platformProtonBT no)
	(not (car ?))
	=>
	(assert (platformProtonCM (yes-or-no-p "Is platform = Proton CM (yes/no)? "))))
	
(defrule platform-Proton-CM-YES ""
	(platformProtonCM yes)
	(not (car ?))
	=>
	(assert (ProtonCmBodyStyle (yes-or-no-p "Select BodyStyle of Proton CM you like: Hatchback = yes, Sedan = no (yes/no)? "))))
	
(defrule platform-Proton-CM-NO ""
	(platformProtonCM no)
	(not (car ?))
	=>
	(assert (platformProtonP2 (yes-or-no-p "Is platform = Proton P2 (yes/no)? "))))

(defrule platform-Proton-P2-YES ""
	(platformProtonP2 yes)
	(not (car ?))
	=>
	(assert (ProtonP2Wheelbase (yes-or-no-p "Is  wheelbase of Proton P2 > 2690 (yes/no)? "))))

(defrule platform-Proton-P2-NO ""
	(platformProtonP2 no)
	(not (car ?))
	=>
	(assert (platformSuzukiZC (yes-or-no-p "Is platform = Suzuki ZC (yes/no)? "))))
	
(defrule engine-capacity-is-lower-than-or-equal-1150 ""
   (enginecapacity no)
   (not (car ?))
   =>
   (assert (car "Proton Tiara"))) 
   
(defrule wheelbase-is-lower-than-or-equal-2417 ""
	(wheelbase no)
	(not (car ?))
	=>
	(assert (car "Proton Saga 1985")))

(defrule platform-GeelyNL-YES ""
	(platformGeelyNL yes)
	(not (car ?))
	=>
	(assert (car "Proton X70")))
	
(defrule manufacture-Year-greater-than-2014 ""
	(manufactureYear yes)
	(not (car ?))
	=>
	(assert (car "Proton Perdana 2016")))
	
(defrule manufacture-Year-lower-than-or-equal-to-2014 ""
	(manufactureYear no)
	(not (car ?))
	=>
	(assert (car "Proton Perdana 2013")))

(defrule platform-mitsubishi-ca-YES ""
	(platformMitsubishiCA yes)
	(not (car ?))
	=>
	(assert (car "Proton Satria")))
	
(defrule platform-mitsubishi-cb-YES ""
	(platformMitsubishiCB yes)
	(not (car ?))
	=>
	(assert (car "Proton Wira Aeroback")))

(defrule platform-mitsubishi-cc-YES ""
	(platformMitsubishiCC yes)
	(not (car ?))
	=>
	(assert (car "Proton Putra")))
	
(defrule platform-mitsubishi-da-YES ""
	(platformMitsubishiDA yes)
	(not (car ?))
	=>
	(assert (car "Proton Waja")))
	
(defrule platform-mitsubishi-E50-YES ""
	(platformMitsubishiE50 yes)
	(not (car ?))
	=>
	(assert (car "Proton Perdana")))
	
(defrule platform-mitsubishi-GS-YES ""
	(platformMitsubishiGS yes)
	(not (car ?))
	=>
	(assert (car "Proton Inspira")))
	
(defrule BodyStyle-Hatchback ""
	(BodyStyle yes)
	(not (car ?))
	=>
	(assert (car "Proton Iriz")))

(defrule BodyStyle-Sedan ""
	(BodyStyle no)
	(not (car ?))
	=>
	(assert (car "Proton Persona")))
	
(defrule platform-Proton-BS-YES ""
	(platformProtonBS yes)
	(not (car ?))
	=>
	(assert (car "Proton Satria Neo")))
	
(defrule gearCount-lower-than-or-equal-to-4.5 ""
	(gearCount no)
	(not (car ?))
	=>
	(assert (car "Proton Saga 2008")))
	
(defrule transmissionType-CVT ""
	(transmissionType yes)
	(not (car ?))
	=>
	(assert (car "Proton Saga FLX")))

(defrule Proton-BT-Engine-Capacity-greater-than-1.45""
	(ProtonBtEngineCapacity yes)
	(not (car ?))
	=>
	(assert (car "Proton Saga 2008")))
	
(defrule Proton-BT-Engine-Capacity-lower-than-or-equal-to-1.45 ""
	(ProtonBtEngineCapacity no)
	(not (car ?))
	=>
	(assert (car "Proton Saga 2016")))
	
(defrule Proton-CM-Body-Style-Hatchback ""
	(ProtonCmBodyStyle yes)
	(not (car ?))
	=>
	(assert (car "Proton Gen 2")))
	
(defrule Proton-CM-Body-Style-Sedan ""
	(ProtonCmBodyStyle no)
	(not (car ?))
	=>
	(assert (car "Proton Persona 2007")))
	
(defrule Proton-P2-wheelbase-greater-than-2690 ""
	(ProtonP2Wheelbase yes)
	(not (car ?))
	=>
	(assert (car "Proton Exora")))
	
(defrule Proton-P2-wheelbase-lower-than-or-equal-to-2690 ""
	(ProtonP2Wheelbase no)
	(not (car ?))
	=>
	(assert (car "Proton Preve")))
	
(defrule platform-Suzuki-ZC-YES ""
	(platformSuzukiZC yes)
	(not (car ?))
	=>
	(assert (car "Proton Ertiga")))
	
(defrule platform-Suzuki-ZC-NO ""
	(platformSuzukiZC no)
	(not (car ?))
	=>
	(assert (car "Sorry, no this type of Proton")))
	
	
(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Proton recommendation System")
  (printout t crlf crlf))

(defrule print-car ""
  (declare (salience 10))
  (car ?item)
  =>
  (printout t crlf crlf)
  (printout t "Suggested Car:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))