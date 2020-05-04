def collect_names(data) 
  collectNames = []

  data.map do |dataKey, dataValue|
    dataValue.each do |key, valueNames|
      valueNames.each do |name|
        if !collectNames.include?(name)
          collectNames << name
        end
      end
    end 
  end
  return collectNames
end

# COLLECT INFO ON PIGEONS 
def collect_each_info(data, allNames)
  infoCollection = []

  data.map do |dataKey, dataValue|
    dataValue.each do |info, nameValue|
      nameValue.each do |whichName|
        allNames.each do |name|
          if whichName == name
            infoCollection << [name, dataKey, info]
          end
        end
      end
    end
  end
  return infoCollection
end

def hash_init(data)
  pigeonData = {}

  data.map do |dataValues|    
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
  return pigeonData

end

def organize_pigeon_data(data)
  names = collect_names(data)
  # p names
  allDetails = collect_each_info(data, names)
  p allDetails
  return hash_init(allDetails)
end