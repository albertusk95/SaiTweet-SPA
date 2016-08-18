package sentiment;

import java.util.LinkedList;

import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

/*
 *	Main class
 */
public class Processor {

	static String main_folder = "resources/";						// the path to the "resources" folder 
	static String test_dataset = "Liebherr";						// available options for demo: goethe, Liebherr, Cisco
	static boolean useSlidingWindowForTraining = false;				// if set to "true", only the last 1,000 documents will be used for the training of the ensemble classifier
	
	public static void main(String[] args) throws Exception {
		
		// get all test set elements
		LinkedList<String> lt = getData(test_dataset);				
		
		SentimentAnalyser analyser = new SentimentAnalyser(main_folder, useSlidingWindowForTraining, test_dataset);
		
		/*
		for (int i=0; i<lt.size(); i++){
			System.out.println(analyser.getPolarity(lt.get(i)));	// any text may be passed as an argument here
			//System.out.println(i+"\t"+out);
		}
		*/
		
		// test case
		LinkedList<String> ltc = new LinkedList<String>();

		ltc.add("@test hi ken I\'m stuck in Dublin huge snooker fan but no red button or any way to be at v live :( could you help");
		ltc.add("I miss my bad ass crew :( http://test.com");
		ltc.add("@test I\'ll be sitting with the home fans don\'t think anyone will mind if I show my allegiance if we do it Vardy banned though :(");
		ltc.add("this is so :( STAN STELLAR");
		ltc.add("@test unofficial poor Rachael she just wants to help us make fresh and healthy 30 minute meals :(");
		ltc.add("@test nicole09 found it in the bathroom :(");
		ltc.add("@test I didn\'t see this in my mentions :( but thank you so much I was first row it was more than amazing");
		ltc.add("I feel bad for just following Mei :( She\'s so nice I-");
		ltc.add(" @test you are not an iron :(");
		ltc.add(" @test she\'s been mean on every show :(");
		ltc.add(" @test @test @test it\'s awful isn\'t it - not safe anywhere unattended :(");
		ltc.add(" What a week for Irish MMA @test cut from UFC200 @test a traitor to his people Now @test forced to retire :(");
		ltc.add(" luke hemmings why is it so hard to follow me :(");
		ltc.add(" my baby\'s all grown :(");
		ltc.add(" @test hope you feel better :(");
		ltc.add(" @test lucyflight I miss u :( :( :(");
		ltc.add(" @test we\'ve tried that :( We\'ve tried two different kinds even He doesn\'t seem bothered");
		ltc.add(" WELP it\'s late and I need to go sleep :(");
		ltc.add(" Girl same :( www.test.com");
		ltc.add(" i\'m trying luke hemmings follow since ever and I feel like giving up :(");
		

		for (int i=0; i < ltc.size(); i++){
			System.out.println(analyser.getPolarity(ltc.get(i)));	// any text may be passed as an argument here
		}
	}
	
	private static LinkedList<String> getData(String f){
		LinkedList<String> all_tweets = new LinkedList<String>();
		DataSource ds;
		Instances data = null;
		
		try {
			System.out.println("getData: " + f);
			// file path: resources/test_sets/Liebherr.arff
			ds = new DataSource(main_folder+"test_sets/"+f+".arff");
			data =  ds.getDataSet();
		} catch (Exception e) {
			System.out.println("File not found.");
		}
		
		// add the test set into list of all_tweets (only for text attribute)
		for (int i = 0; i < data.numInstances(); i++) {
			all_tweets.add(data.get(i).stringValue(0));
		}
		
		return all_tweets;
	}
}