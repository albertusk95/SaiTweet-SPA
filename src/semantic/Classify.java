package semantic;

import java.util.ArrayList;

import weka.core.*;
import weka.classifiers.meta.FilteredClassifier;

public class Classify {
	
	private String fileName = "";
	
	FilteredClassifier classifier;
	Instances instances;

	public Classify(String fName) {
		fileName = fileName + System.getProperty("user.home") + "/workspace/TwitterServlet/resources/semantic/" + fName;
	}
	
	/*
	 * Read the previous built model
	 */
	public void loadModel() {
		try {
			classifier = (FilteredClassifier) weka.core.SerializationHelper.read(fileName);
 			System.out.println("===== Loaded model: " + fileName + " =====");
       } 
		catch (Exception e) {
			System.out.println("Problem found when reading: " + fileName);
			e.printStackTrace();
		}
	}
	
	/*
	 * Create the attributes, class and text
	 */
	public void makeInstance(String textTweet) {
		
		ArrayList<String> fvNominalVal = new ArrayList<String>();
		fvNominalVal.add("alt.atheism");
		fvNominalVal.add("comp.graphics");
		fvNominalVal.add("comp.os.ms-windows.misc");
		fvNominalVal.add("comp.sys.ibm.pc.hardware");
		fvNominalVal.add("comp.sys.mac.hardware");
		fvNominalVal.add("comp.windows.x");
		fvNominalVal.add("misc.forsale");
		fvNominalVal.add("rec.autos");
		fvNominalVal.add("rec.motorcycles");
		fvNominalVal.add("rec.sport.baseball");
		fvNominalVal.add("rec.sport.hockey");
		fvNominalVal.add("sci.crypt");
		fvNominalVal.add("sci.electronics");
		fvNominalVal.add("sci.med");
		fvNominalVal.add("sci.space");
		fvNominalVal.add("soc.religion.christian");
		fvNominalVal.add("talk.politics.guns");
		fvNominalVal.add("talk.politics.mideast");
		fvNominalVal.add("talk.politics.misc");
		fvNominalVal.add("talk.religion.misc");
		
		Attribute attribute1 = new Attribute("category", fvNominalVal);
		Attribute attribute2 = new Attribute("text", (ArrayList<String>)null);
		
		// Create list of instances with one element
		ArrayList<Attribute> fvWekaAttributes = new ArrayList<Attribute>(2);
		fvWekaAttributes.add(attribute1);
		fvWekaAttributes.add(attribute2);
		
		instances = new Instances("Test relation", fvWekaAttributes, 1);           
		
		// Set class index
		instances.setClassIndex(0);
		
		// Create and add the instance
		DenseInstance instance = new DenseInstance(2);
		instance.setValue(attribute2, textTweet);
		
		instances.add(instance);
 		
		System.out.println("===== Instance created with reference dataset =====");
		System.out.println(instances);
	}
	
	public String classify() {
		
		String predictedCls = null;
		
		try {
			double pred = classifier.classifyInstance(instances.instance(0));
			double distribution[] = classifier.distributionForInstance(instances.instance(0));

			System.out.println("===== Classified instance =====");
			System.out.println("Instance: " + instances.instance(0));
			
			for (int i = 0; i < distribution.length; i++) {
				System.out.println("distribution: " + String.valueOf(distribution[i]));
			}
			
			predictedCls = instances.classAttribute().value((int) pred);
			System.out.println("Class predicted: " + predictedCls);
			
		}
		catch (Exception e) {
			System.out.println("Problem found when classifying the text");
			e.printStackTrace();
		}	

		return predictedCls;
	}
}
