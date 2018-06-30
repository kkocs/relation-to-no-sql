package XMLGenerator;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.bind.annotation.adapters.XmlAdapter;

/**
 * <code>DateAdapter</code> is an {@link XmlAdapter} implementation that
 * (un)marshals dates between <code>String</code> and <code>Date</code> representations.
 * All date strings meet <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO
 * 8601</a> basic format. For example, June 16, 2011 16:46:01 GMT is
 * "20110616164601Z". Adapted from
 * http://blogs.oracle.com/CoreJavaTechTips/entry/exchanging_data_with_xml_and
 */

public class DateAdapter extends XmlAdapter<String, Date> {

	private static Logger logger = Logger
			.getLogger(DateAdapter.class.getName());
	private SimpleDateFormat format;

	public DateAdapter() {
		//format = new SimpleDateFormat("yyyyMMddHHmmss'Z'");
		format = new SimpleDateFormat("yyyy-MM-dd");
		format.setTimeZone(TimeZone.getTimeZone("GMT"));
	}

	@Override
	public String marshal(Date d) throws Exception {
		logger.info(d.toString());

		try {
			return format.format(d);
		} catch (Exception e) {
			logger.log(Level.WARNING,
					String.format("Failed to format date %s", d.toString()), e);
			return null;
		}
	}

	@Override
	public Date unmarshal(String d) throws Exception {
		logger.info(d);

		if (d == null) {
			return null;
		}

		try {
			return format.parse(d);
		} catch (ParseException e) {
			logger.log(Level.WARNING,
					String.format("Failed to parse string %s", d), e);
			return null;
		}
	}

}