package sentiment;

import java.io.IOException;
import java.util.ArrayList;

import edu.stanford.nlp.tagger.maxent.MaxentTagger;

import weka.core.Attribute;
import weka.core.Instances;
import weka.core.SparseInstance;


public class TweetPreprocessor {
	
	String tweet;
	//long maxid;
	String main_folder;
	TextPreprocessor tp;
	ComplexPreprocessor cp;
	FeaturePreprocessor fp;
	LexiconPreprocessor lp;
	Instances text_instances;
	Instances feature_instances;
	Instances complex_instances;
	Instances lexicon_instances;
	MaxentTagger tagger;
	
	public TweetPreprocessor(String t){
		//maxid = 0;
		
		// resource directory
		main_folder = t;
		
		// preprocessor (filterer) for text, feature, and complex representation
		tp = new TextPreprocessor(main_folder);
		cp = new ComplexPreprocessor();
		fp = new FeaturePreprocessor(main_folder);
		
		// part of speech tagger
		tagger = new MaxentTagger(main_folder+"datasets/wsj-0-18-left3words-distsim.tagger");
		
		/*
		try {
			tagger = new MaxentTagger(main_folder+"datasets/wsj-0-18-left3words-distsim.tagger");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
		// preprocessor (filterer) for lexicon
		try {
			lp = new LexiconPreprocessor(main_folder);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**Getter*/
	public Instances[] getAllInstances(){
		Instances[] all = new Instances[4];
		all[0] = text_instances;
		all[1] = feature_instances;
		all[2] = complex_instances;
		all[3] = lexicon_instances;
		return all;
	}
	
	/**Setter*/
	public void setTweet(String t){
		tweet = t;
		//maxid++;
	}
	
	public void startProc(){
		//String dataset = Double.toString(maxid);
		String processed_text = getTextInstances();	
		getComplexInstances(processed_text);
		getFeatureInstances();						
		setLexiconInstances();
		//return dataset;
	}
	
	/*
	 * Instantiates the text-based Instances
	 */
	private String getTextInstances(){
		ArrayList<Attribute> atts = new ArrayList<Attribute>(2);
        ArrayList<String> classVal = new ArrayList<String>();
        classVal.add("positive");
        classVal.add("negative");
        atts.add(new Attribute("sentimentClassAttribute",classVal));
        atts.add(new Attribute("text",(ArrayList<String>)null));
        
        // create instances (relation) with name TextInstances with attributes atts and initial size 0
        Instances textRaw = new Instances("TextInstances",atts,0);
        
        // processes the tweet 
        double[] instanceValue1 = new double[textRaw.numAttributes()];
        String tmp_txt = tp.getProcessed(tweet);
        instanceValue1[1] = textRaw.attribute(1).addStringValue(tmp_txt);
        textRaw.add(new SparseInstance(1.0, instanceValue1));
		text_instances = new Instances(textRaw);
        return tmp_txt;
	}
	
	/*
	 * Initiates the feature-based Instances
	 */
	private void getFeatureInstances(){
		ArrayList<Attribute> atts = new ArrayList<Attribute>(2);
        ArrayList<String> classVal = new ArrayList<String>();
        classVal.add("positive");
        classVal.add("negative");
        atts.add(new Attribute("sentimentClassAttribute",classVal));
        atts.add(new Attribute("text",(ArrayList<String>)null));
        Instances textRaw = new Instances("TextInstances",atts,0);
        double[] instanceValue1 = new double[textRaw.numAttributes()];
        instanceValue1[1] = textRaw.attribute(1).addStringValue(fp.getProcessed(tweet));
        textRaw.add(new SparseInstance(1.0, instanceValue1));
		feature_instances = new Instances(textRaw);
	}
	
	/*
	 * Initiates the complex-based Instances
	 */
	private String getComplexInstances(String processed_text){
		ArrayList<Attribute> atts = new ArrayList<Attribute>(2);
        ArrayList<String> classVal = new ArrayList<String>();
        classVal.add("positive");
        classVal.add("negative");
        atts.add(new Attribute("sentimentClassAttribute",classVal));
        atts.add(new Attribute("text",(ArrayList<String>)null));
        Instances textRaw = new Instances("TextInstances",atts,0);
        double[] instanceValue1 = new double[textRaw.numAttributes()];
        String tmp_cmplx = cp.getProcessed(processed_text, tagger);
        instanceValue1[1] = textRaw.attribute(1).addStringValue(tmp_cmplx);
        textRaw.add(new SparseInstance(1.0, instanceValue1));
		complex_instances = new Instances(textRaw);
		return tmp_cmplx;
	}
	
	private void setLexiconInstances(){
		ArrayList<Attribute> atts = new ArrayList<Attribute>(6);
        ArrayList<String> classVal = new ArrayList<String>();
        classVal.add("positive");
        classVal.add("negative");
        
        atts.add(new Attribute("verb"));
        atts.add(new Attribute("noun"));
        atts.add(new Attribute("adj"));
        atts.add(new Attribute("adv"));
        atts.add(new Attribute("wordnet"));
        atts.add(new Attribute("polarity"));
        atts.add(new Attribute("sentimentClassAttribute",classVal));
        
        Instances textRaw = new Instances("TextInstances",atts,0);
        double[] vals = lp.getProcessed(tweet, tagger);
        textRaw.add(new SparseInstance(1.0, vals));
		lexicon_instances = new Instances(textRaw);
	}
}