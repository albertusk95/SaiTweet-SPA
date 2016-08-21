package visuals;

import java.util.ArrayList;
import java.util.List;

import saitweet.Tweet;

public class PieChartData {

	public static List<KeyValue> pieDataList;
	
	// get the number of positive sentiment
	public static int getNumPos() {
		
		int counter = 0;
		for (String itm : Tweet.qrTweets_Sentiment) {
			if (itm.contains("pos")) {
				counter++;
			}
		}
		
		return counter;
	}
	
	// get the number of negative sentiment
	public static int getNumNeg() {
		
		int counter = 0;
		for (String itm : Tweet.qrTweets_Sentiment) {
			if (itm.contains("neg")) {
				counter++;
			}
		}
		
		return counter;
	}
	
	// set the pie chart data
	public static void setChartData() {
        
		/*
		int numPosSentiment = getNumPos();
		int numNegSentiment = getNumNeg();
		*/
		
		pieDataList = new ArrayList<PieChartData.KeyValue>();
		
		/*
		pieDataList.add(new KeyValue("positive", numPosSentiment));
        pieDataList.add(new KeyValue("negative", numNegSentiment));
    	*/
	
		pieDataList.add(new KeyValue("positive", 3));
        pieDataList.add(new KeyValue("negative", 5));
    	
	}
 
    public static List<KeyValue> getPieDataList() {
        return pieDataList;
    }
 
    public static class KeyValue {
        String key;
        int value;
 
        public KeyValue(String key, int value) {
            super();
            this.key = key;
            this.value = value;
        }
 
        public String getKey() {
            return key;
        }
 
        public void setKey(String key) {
            this.key = key;
        }
 
        public int getValue() {
            return value;
        }
 
        public void setValue(int value) {
            this.value = value;
        }
 
    }
}
