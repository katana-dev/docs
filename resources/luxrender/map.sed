#More squared is fine
s/"integer xresolution" \[1920\]/"integer xresolution" \[1320\]/g
s/"float screenwindow" \[-1.000000000000000 1.000000000000000 -0.562500000000000 0.562500000000000\]/"float screenwindow" \[-1.0 1.0 -0.818181818182 0.818181818182\]/g

#Back sun
#s/"vector sundir" \[0.028625251725316 -0.011037390679121 0.040162373334169\]/"vector sundir" \[0.018625251725316 0.021037390679121 0.040162373334169\]/g

#Front sun
s/"vector sundir" \[0.028625251725316 -0.011037390679121 0.040162373334169\]/"vector sundir" \[-0.018625251725316 -0.021037390679121 0.040162373334169\]/g

#Increase ground size
s/"point P" \[-1000.000000000000000 -1000.000000000000000 .*$/"point P" \[-3000.000000000000000 -3000.000000000000000 0.000000000000000 3000.000000000000000 -3000.000000000000000 0.000000000000000 3000.000000000000000 3000.000000000000000 0.000000000000000 -3000.000000000000000 3000.000000000000000 0.000000000000000\]/g

# Frame
s/^NamedMaterial "FreeCADMaterial_Lux_\(Pad005\|Pocket011\)"/NamedMaterial "FrameMaterial"/g

# Speaker
s/^NamedMaterial "FreeCADMaterial_Lux_\(Fillet005\|Cut001\|Pad007\)"/NamedMaterial "BlackMetal"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Fillet007"/NamedMaterial "DullMetal"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Scale"/NamedMaterial "StickerWhite"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Extrude012"/NamedMaterial "StickerMat"/g

# Feet
s/^NamedMaterial "FreeCADMaterial_Lux_Compound001"/NamedMaterial "FeetMat"/g

# Corners, panel, knobs
s/^NamedMaterial "FreeCADMaterial_Lux_\(Compound002\|Cut006\)"/NamedMaterial "Corners"/g
s/^NamedMaterial "FreeCADMaterial_Lux_\(Compound004\|Fusion005\|Array\)"/NamedMaterial "Corners"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Compound\(007\|015\)"/NamedMaterial "Corners"/g

# Jacks
s/^NamedMaterial "FreeCADMaterial_Lux_Cut\(012\|022\|025\|018\|017\|026\|020\)"/NamedMaterial "Corners"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Cut\(013\|021\|016\|027\|019\|024\|023\)"/NamedMaterial "DullMetal"/g
s/^NamedMaterial "FreeCADMaterial_Lux_\(Chamfer004\|Box006\)"/NamedMaterial "Corners"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Fillet016"/NamedMaterial "DullMetal"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Cut033"/NamedMaterial "Corners"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Compound016"/NamedMaterial "DullMetal"/g

# Panel metal
s/^NamedMaterial "FreeCADMaterial_Lux_Cut034"/NamedMaterial "BlackDullMetal"/g

# Strips
s/^NamedMaterial "FreeCADMaterial_Lux_Part__Mirroring"/NamedMaterial "SilverStrip"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Box002"/NamedMaterial "SilverStrip"/g

# Front logo
s/^NamedMaterial "FreeCADMaterial_Lux_Scale002"/NamedMaterial "DullMetal"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Chamfer001"/NamedMaterial "Corners"/g

# Handle
s/^NamedMaterial "FreeCADMaterial_Lux_Compound017"/NamedMaterial "Corners"/g
s/^NamedMaterial "FreeCADMaterial_Lux_Array009"/NamedMaterial "ClearMetal"/g

# Front screws
s/^NamedMaterial "FreeCADMaterial_Lux_Array010"/NamedMaterial "ClearMetal"/g

# Mesh
s/^NamedMaterial "FreeCADMaterial_Lux_Box001"/NamedMaterial "FrontMesh"/g
