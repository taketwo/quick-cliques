
OBJECT_DIR = obj
SRC_DIR    = src
BIN_DIR    = bin

OBJECTS += $(OBJECT_DIR)/CacheEfficientDegeneracyVertexSets.o
OBJECTS += $(OBJECT_DIR)/DegeneracyVertexSets.o
OBJECTS += $(OBJECT_DIR)/AdjacencyListVertexSets.o
OBJECTS += $(OBJECT_DIR)/BronKerboschAlgorithm.o
OBJECTS += $(OBJECT_DIR)/MemoryManager.o
OBJECTS += $(OBJECT_DIR)/MaximalCliquesAlgorithm.o
OBJECTS += $(OBJECT_DIR)/TomitaAlgorithm.o
OBJECTS += $(OBJECT_DIR)/AdjacencyListAlgorithm.o
OBJECTS += $(OBJECT_DIR)/TimeDelayAdjacencyListAlgorithm.o
OBJECTS += $(OBJECT_DIR)/TimeDelayMaxDegreeAlgorithm.o
OBJECTS += $(OBJECT_DIR)/TimeDelayDegeneracyAlgorithm.o
OBJECTS += $(OBJECT_DIR)/HybridAlgorithm.o
OBJECTS += $(OBJECT_DIR)/DegeneracyAlgorithm.o
OBJECTS += $(OBJECT_DIR)/FasterDegeneracyAlgorithm.o
OBJECTS += $(OBJECT_DIR)/DegeneracyTools.o
OBJECTS += $(OBJECT_DIR)/Tools.o

EXEC_NAMES = printnm compdegen tomita adjlist hybrid degeneracy qc

EXECS = $(addprefix $(BIN_DIR)/, $(EXEC_NAMES))

#DEFINE += -DDEBUG       #for debugging
#DEFINE += -DMEMORY_DEBUG #for memory debugging.
#DEFINE += -DRETURN_CLIQUES_ONE_BY_ONE 
#DEFINE += -DPRINT_CLIQUES_ONE_BY_ONE 

#DEFINE += -DPRINT_CLIQUES_TOMITA_STYLE # used by Eppstein and Strash (2011)

#some systems handle malloc and calloc with 0 bytes strangely.
DEFINE += -DALLOW_ALLOC_ZERO_BYTES # used by Eppstein and Strash (2011) 

VPATH = src

.PHONY : all

all: $(EXECS)

.PHONY : clean

clean: 
	rm -rf $(OBJECTS) $(EXECS) $(OBJECT_DIR) $(BIN_DIR)

$(BIN_DIR)/printnm: printnm.cpp ${OBJECTS} ${BIN_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} ${OBJECTS} $(SRC_DIR)/printnm.cpp -o $@

$(BIN_DIR)/compdegen: compdegen.cpp ${OBJECTS} ${BIN_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} ${OBJECTS} $(SRC_DIR)/compdegen.cpp -o $@

$(BIN_DIR)/qc: main.cpp ${OBJECTS} ${BIN_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} ${OBJECTS} $(SRC_DIR)/main.cpp -o $@

$(OBJECT_DIR)/MemoryManager.o: MemoryManager.cpp MemoryManager.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/MemoryManager.cpp -o $@

$(OBJECT_DIR)/MaximalCliquesAlgorithm.o: MaximalCliquesAlgorithm.cpp MaximalCliquesAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/MaximalCliquesAlgorithm.cpp -o $@

$(OBJECT_DIR)/TomitaAlgorithm.o: TomitaAlgorithm.cpp TomitaAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/TomitaAlgorithm.cpp -o $@

$(OBJECT_DIR)/AdjacencyListAlgorithm.o: AdjacencyListAlgorithm.cpp AdjacencyListAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/AdjacencyListAlgorithm.cpp -o $@

$(OBJECT_DIR)/TimeDelayAdjacencyListAlgorithm.o: TimeDelayAdjacencyListAlgorithm.cpp TimeDelayAdjacencyListAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/TimeDelayAdjacencyListAlgorithm.cpp -o $@

$(OBJECT_DIR)/TimeDelayMaxDegreeAlgorithm.o: TimeDelayMaxDegreeAlgorithm.cpp TimeDelayMaxDegreeAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/TimeDelayMaxDegreeAlgorithm.cpp -o $@

$(OBJECT_DIR)/TimeDelayDegeneracyAlgorithm.o: TimeDelayDegeneracyAlgorithm.cpp TimeDelayDegeneracyAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/TimeDelayDegeneracyAlgorithm.cpp -o $@

$(OBJECT_DIR)/HybridAlgorithm.o: HybridAlgorithm.cpp HybridAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/HybridAlgorithm.cpp -o $@

$(OBJECT_DIR)/DegeneracyAlgorithm.o: DegeneracyAlgorithm.cpp DegeneracyAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/DegeneracyAlgorithm.cpp -o $@

$(OBJECT_DIR)/CacheEfficientDegeneracyVertexSets.o: CacheEfficientDegeneracyVertexSets.cpp CacheEfficientDegeneracyVertexSets.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/CacheEfficientDegeneracyVertexSets.cpp -o $@

$(OBJECT_DIR)/FasterDegeneracyAlgorithm.o: FasterDegeneracyAlgorithm.cpp FasterDegeneracyAlgorithm.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/FasterDegeneracyAlgorithm.cpp -o $@

$(OBJECT_DIR)/DegeneracyTools.o: DegeneracyTools.cpp DegeneracyTools.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/DegeneracyTools.cpp -o $@

$(OBJECT_DIR)/Tools.o: Tools.cpp Tools.h ${OBJECT_DIR}
	g++ -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/Tools.cpp -o $@

$(OBJECT_DIR)/AdjacencyListVertexSets.o: AdjacencyListVertexSets.cpp AdjacencyListVertexSets.h ${OBJECT_DIR}
	g++ -Winline -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/AdjacencyListVertexSets.cpp -o $@

$(OBJECT_DIR)/DegeneracyVertexSets.o: DegeneracyVertexSets.cpp DegeneracyVertexSets.h ${OBJECT_DIR}
	g++ -Winline -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/DegeneracyVertexSets.cpp -o $@

$(OBJECT_DIR)/BronKerboschAlgorithm.o: BronKerboschAlgorithm.cpp BronKerboschAlgorithm.h ${OBJECT_DIR}
	g++ -Winline -O2 -std=c++11 -g ${DEFINE} -c $(SRC_DIR)/BronKerboschAlgorithm.cpp -o $@

 ${OBJECT_DIR}:
	mkdir ${OBJECT_DIR}

${BIN_DIR}:
	mkdir ${BIN_DIR}
