
def nyc_pigeon_organizer(pigeon_data)
  collectNames = []
  infoCollection = []
  pigeonData = {}

  pigeon_data.map do |dataKey, dataValue|
    dataValue.each do |key, valueNames|
      valueNames.each do |name|
        if !collectNames.include?(name)
          collectNames << name
        end
      end
    end 
  end

  pigeon_data.map do |dataKey, dataValue|
    dataValue.each do |info, nameValue|
      nameValue.each do |whichName|
        collectNames.each do |name|
          if whichName == name
            infoCollection << [name, dataKey, info]
          end
        end
      end
    end
  end

  infoCollection.map do |dataValues|    
    if !pigeonData[dataValues[0]]
      pigeonData[dataValues[0]] = {}
    end
    if !pigeonData[dataValues[0]][dataValues[1]]
      pigeonData[dataValues[0]][dataValues[1]] = []
    end
    if !pigeonData[dataValues[0]][dataValues[1]].include?(dataValues[2])
      pigeonData[dataValues[0]][dataValues[1]] << dataValues[2].to_s
    end
  end

  return pigeon_data
end