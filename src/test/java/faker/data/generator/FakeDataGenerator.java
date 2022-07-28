package faker.data.generator;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

public class FakeDataGenerator {
		
	/**
	 * this method will take no parameter but return a dummy email 
	 * with the help of Faker class from com.github.javaFaker.Faker
	 * @return
	 * a dummy Email
	 */
	public static String getEmail() {
	Faker faker = new Faker();
	return faker.name().firstName()+faker.name().lastName() + "@gmail.com";
	}
	/**
	 * this method will take no parameter but return a dummy first name 
	 * with the help of Faker class from com.github.javaFaker.Faker
	 * @return
	 * a dummy first name
	 */
	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
	}
	
	/**
	 * this method will take no parameter but return a dummy last name 
	 * with the help of Faker class from com.github.javaFaker.Faker
	 * @return
	 * a dummy last name
	 */
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}
	
	/**
	 * this method will take no parameter but return a dummy phone number 
	 * with the help of Faker class from com.github.javaFaker.Faker
	 * @return
	 * a dummy phone number
	 */
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();
	}
	
	/**
	 * this method will take no parameter but return a dummy date of birth 
	 * with the help of Faker class from com.github.javaFaker.Faker
	 * @return
	 * a dummy date of birth
	 */
	public static String getDob() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
}
