package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.LegalText;

@Component
@Transactional
public class LegalTextToStringConverter implements Converter<LegalText, String> {
	
	@Override
	public String convert(LegalText legalText) {
		String result;

		if (legalText == null)
			result = null;
		else
			result = String.valueOf(legalText.getId());

		return result;
	}

}