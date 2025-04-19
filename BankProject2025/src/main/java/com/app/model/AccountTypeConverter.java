package com.app.model;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class AccountTypeConverter implements AttributeConverter<String, String> {

    @Override
    public String convertToDatabaseColumn(String accType) {
        if (accType == null) {
            return null;
        }
        return accType.toUpperCase(); // Ensure data consistency in DB
    }

    @Override
    public String convertToEntityAttribute(String dbData) {
        if (dbData == null || dbData.isBlank()) {
            return "Unknown"; // Return Unknown if null or blank
        }

        switch (dbData) {
            case "1": return "SA"; 
            case "2": return "CA"; 
            case "SA": 
            case "CA": return dbData;
            default:
                return "(" + dbData + ")"; // Display Invalid with actual value
        }
    }


}
