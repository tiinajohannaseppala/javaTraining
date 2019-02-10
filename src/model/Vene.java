package model;

public class Vene {
		int tunnus;
		String nimi;
		String merkkimalli;
		double pituus, leveys;
		int hinta, tila;
		
		public Vene() {
			super();
		}
		
		public Vene(int tunnus, String nimi, String merkkimalli, double pituus, double leveys, int hinta, int tila) {
			super();
			this.tunnus = tunnus;
			this.nimi = nimi;
			this.merkkimalli = merkkimalli;
			this.pituus = pituus;
			this.leveys = leveys;
			this.hinta = hinta;
			this.tila = tila;
		}

		public Vene(String nimi, String merkkimalli, double pituus, double leveys, int hinta, int tila) {
			super();
			this.nimi = nimi;
			this.merkkimalli = merkkimalli;
			this.pituus = pituus;
			this.leveys = leveys;
			this.hinta = hinta;
			this.tila = tila;
		}

		public int getTunnus() {
			return tunnus;
		}

		public void setTunnus(int tunnus) {
			this.tunnus = tunnus;
		}

		public String getNimi() {
			return nimi;
		}

		public void setNimi(String nimi) {
			this.nimi = nimi;
		}

		public String getMerkkimalli() {
			return merkkimalli;
		}

		public void setMerkkimalli(String merkkimalli) {
			this.merkkimalli = merkkimalli;
		}

		public double getPituus() {
			return pituus;
		}

		public void setPituus(double pituus) {
			this.pituus = pituus;
		}

		public double getLeveys() {
			return leveys;
		}

		public void setLeveys(double leveys) {
			this.leveys = leveys;
		}

		public int getHinta() {
			return hinta;
		}

		public void setHinta(int hinta) {
			this.hinta = hinta;
		}
		

		public int getTila() {
			return tila;
		}

		public void setTila(int tila) {
			this.tila = tila;
		}

		@Override
		public String toString() {
			return "Vene [tunnus=" + tunnus + ", nimi=" + nimi + ", merkkimalli=" + merkkimalli + ", pituus=" + pituus
					+ ", leveys=" + leveys + ", hinta=" + hinta + ", tila=" + tila + "]";
		}
	}
